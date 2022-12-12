import 'package:get/get.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:project/data/models/app_user.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/services/stories_service.dart';
import 'package:project/services/user_service.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:async';

class SingleStoryController extends GetxController {
  final UserService _userService = UserService();
  final StoriesService _storiesService = StoriesService();
  AppUser appUser = Get.find<AuthController>().appUser;
  final RxBool _isLike = false.obs;

  bool get isLike => _isLike.value;

  final RxBool _reload = false.obs;

  bool get reload => _reload.value;

  final Story story = Get.arguments;

  final Rx<GeofenceStatus> _geofenceStatus = GeofenceStatus.EXIT.obs;

  GeofenceStatus get geofenceStatus => _geofenceStatus.value;

  final geofenceStreamController = StreamController<Geofence>();

  // Create a [GeofenceService] instance and set options.
  final geofenceService = GeofenceService.instance.setup(
      interval: 1000,
      accuracy: 100,
      loiteringDelayMs: 60000,
      statusChangeDelayMs: 3000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: false,
      geofenceRadiusSortType: GeofenceRadiusSortType.DESC);

  // This function is to be called when the geofence status is changed.
  Future<void> _onGeofenceStatusChanged(
      Geofence geofence, GeofenceRadius geofenceRadius, GeofenceStatus geofenceStatus, Location location) async {
    log('geofence: ${geofence.toJson()}');
    log('geofenceRadius: ${geofenceRadius.toJson()}');
    log('geofenceStatus: ${geofenceStatus.toString()}');
    geofenceStreamController.sink.add(geofence);
    _geofenceStatus.value = geofenceStatus;
  }

  // This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {
    // log('location: ${location.toJson()}');
  }

  // This function is to be called when a location services status change occurs
  // since the service was started.
  void _onLocationServicesStatusChanged(bool status) {
    log('isLocationServicesEnabled: $status');
  }

  // This function is used to handle errors that occur in the service.
  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      log('Undefined error: $error');
      return;
    }
    log('ErrorCode: $errorCode add permissions and service to android manifest');
  }

  @override
  void onInit() {
    super.onInit();
    final geofenceList = <Geofence>[
      Geofence(
        id: 'place_1',
        latitude: story.geoPoint!.latitude,
        longitude: story.geoPoint!.longitude,
        radius: [
          GeofenceRadius(id: 'radius_50m', length: 50),
        ],
      ),
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
      geofenceService.addLocationChangeListener(_onLocationChanged);
      geofenceService.addLocationServicesStatusChangeListener(_onLocationServicesStatusChanged);
      geofenceService.addStreamErrorListener(_onError);
      geofenceService.start(geofenceList).catchError(_onError);
    });
    log('geofenceList: ${geofenceList[0].toJson()}');
  }

  @override
  void onReady() async {
    _isLike.value = await _userService.checkLike(story, appUser);
    super.onReady();
  }

  @override
  void onClose() {
    geofenceStreamController.close();
    geofenceService.stop();
    log('clearing all services');
    super.onClose();
  }

  Future likeStory() async {
    await _userService.likeStory(story, appUser);
    await _storiesService.addLike(story);
    _isLike.value = true;
    _reload.value = true;
  }

  Future dislikeStory() async {
    await _userService.dislikeStory(story, appUser);
    await _storiesService.removeLike(story);
    _isLike.value = false;
    _reload.value = true;
  }
}
