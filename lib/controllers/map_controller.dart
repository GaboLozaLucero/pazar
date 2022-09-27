import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  GoogleMapController? _googleMapController;
  Location location = Location();

  // ignore: prefer_final_fields
  RxBool _isLoading1 = true.obs;

  bool get isLoading1 => _isLoading1.value;

  // ignore: prefer_final_fields
  Rx<LatLng> _locationPosition = const LatLng(-16.49817713198687, -68.133475729177).obs;

  LatLng get locationPosition => _locationPosition.value;

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
}
