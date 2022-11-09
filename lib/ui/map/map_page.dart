import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/controllers/map_controller.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'dart:developer';

import 'package:project/ui/widgets/button/floating_story_button.dart';

class MapPage extends GetView<MapController> {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MapController>(
      initState: (state) async {
        await controller.getUserLocation();
        log('this is my current location when pages inits: ${controller.locationPosition.latitude} ${controller.locationPosition.longitude}');
      },
      builder: (_) {
        if (_.isLoading1) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text('Cargando mapa'),
                ],
              ),
            ),
          );
        } else {
          log('this is my current location after circular indicator: ${_.locationPosition.latitude} ${_.locationPosition.longitude}');
          return Scaffold(
            appBar: const CustomAppbar(title: 'Mapa'),
            body: SafeArea(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (mapController) {
                      _.onMapCreated(mapController);
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(controller.locationPosition.latitude, controller.locationPosition.longitude),
                      zoom: 16.0,
                    ),
                    zoomControlsEnabled: false,
                    minMaxZoomPreference: const MinMaxZoomPreference(10.0, 20.0),
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                  ),
                  FloatingStoryButton(
                    iconData: Icons.my_location,
                    function: () {
                      log('this is pressed');
                      controller.currentLocation();
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
