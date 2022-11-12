// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/services/stories_service.dart';

class MapController extends GetxController {
  GoogleMapController? _googleMapController;
  Location location = Location(); //user location

  // ignore: prefer_final_fields
  RxBool _isLoading1 = true.obs;

  bool get isLoading1 => _isLoading1.value;

  // ignore: prefer_final_fields
  Rx<LatLng> _locationPosition = const LatLng(-16.49817713198687, -68.133475729177).obs;  //default location where map starts

  LatLng get locationPosition => _locationPosition.value;

  final RxList<LatLng> _polyLinesCoordinates = <LatLng>[].obs;

  List<LatLng> get polyLinesCoordinates => _polyLinesCoordinates.value;
  PolylinePoints polylinePoints = PolylinePoints();

  final RxList<Story> _myths = <Story>[].obs;

  List<Story> get myths => _myths.value;
  final RxList<Story> _legends = <Story>[].obs;

  List<Story> get legends => _legends.value;
  final StoriesService _storiesService = StoriesService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onMapCreated(GoogleMapController googleMapController) {
    _googleMapController = googleMapController;
  }

  getUserLocation() async {
    if (await permissions()) {
      //permissions will allow the phone to use gps and show position on map
      _isLoading1.value = false;
      location.onLocationChanged.listen((LocationData locationData) {
        _locationPosition.value = LatLng(locationData.latitude!, locationData.longitude!);
        log('=============================== $locationPosition');
      }).pause(Future.delayed(const Duration(seconds: 2)));
      // _locationPosition.value = const LatLng(-16.49817713198687, -68.133475729177);
    }
  }

  Future<bool> permissions() async {
    bool _serviceEnabled = await location.serviceEnabled();
    PermissionStatus _permissionGranted;
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  currentLocation() {
    _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_locationPosition.value.latitude, _locationPosition.value.longitude),
      zoom: 16.0,
    )));
  }

  createPolyLines(LatLng tapped) async {
    _polyLinesCoordinates.clear();
    PointLatLng origin = PointLatLng(locationPosition.latitude, locationPosition.longitude);
    PointLatLng destination = PointLatLng(tapped.latitude, tapped.longitude);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDO2HmEOMlGgqFCfEqIALQY9Gk-Sl6TWWg', //TODO hide APIKEY
      origin,
      destination,
      travelMode: TravelMode.walking,
    );
    for (int i = 0; i < result.points.length; i++) {
      log('latitude: ${result.points[i].latitude}  longitude: ${result.points[i].longitude}');
      _polyLinesCoordinates.value.add(LatLng(result.points[i].latitude, result.points[i].longitude));
    }
    _polyLinesCoordinates.refresh();
    _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_locationPosition.value.latitude, _locationPosition.value.longitude),
      zoom: 16.0,
    )));
  }

  Future getStories() async { //retrieves all stories and separate them in myths and legends
    _isLoading1.value = true;
    final resultMyths = await _storiesService.retrieveStories('myth');
    final resultLegends = await _storiesService.retrieveStories('legend');
    _myths.value = resultMyths!;
    _legends.value = resultLegends!;
    // Uint8List mapMarker= await getBytesFromAssets('./assets/images/myth_image.png', 70);
    _isLoading1.value = false;
  }

  // Rx<Uint8List> _mapMarker = Uint8List(70).obs;
  // Uint8List mapMarker get => _mapMarker.value;

  Future<Uint8List> getBytesFromAssets(String path, int size) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: size);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
