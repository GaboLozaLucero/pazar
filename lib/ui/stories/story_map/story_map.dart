import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/controllers/map_controller.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'package:project/ui/widgets/button/floating_story_button.dart';
import 'package:project/ui/widgets/loading/circular_loading_indicator.dart';
import 'dart:developer';

class StoryMap extends GetView<MapController> {
  StoryMap({Key? key}) : super(key: key);

  final Story _story = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetX<MapController>(initState: (state) async {
      await controller.getUserLocation();
    }, builder: (_) {
      if (_.isLoading1) {
        return const CircularLoadingIndicator(
          text: 'Cargando mapa',
        );
      }
      Set<Polyline> polys = {};
      polys.add(Polyline(
        polylineId: PolylineId('poly id'),
        points: controller.polyLinesCoordinates,
        color: ConstantColors.polyLinesColor,
        width: 5,
        consumeTapEvents: true,
        endCap: Cap.roundCap,
        startCap: Cap.roundCap,
      ));
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
                  target: LatLng(_story.geoPoint!.latitude, _story.geoPoint!.longitude),
                  zoom: 16.0,
                ),
                zoomControlsEnabled: false,
                minMaxZoomPreference: const MinMaxZoomPreference(10.0, 20.0),
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                polylines: polys,
                markers: _getMarkers(),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingStoryButton(
              iconData: Icons.my_location,
              function: () {
                log('this is pressed');
                controller.currentLocation();
              },
            ),
            FloatingStoryButton(
              iconData: Icons.camera_alt_outlined,
              function: () {},
            ),
          ],
        ),
      );
    });
  }

  Set<Marker> _getMarkers() {
    Set<Marker> points = {};
    points.add(
      Marker(
          markerId: MarkerId(_story.name!),
          position: LatLng(_story.geoPoint!.latitude, _story.geoPoint!.longitude),
          anchor: const Offset(0.5, 0.5),
          // infoWindow: InfoWindow(
          //   title: '${myth.address}',
          //   onTap: () {
          //     _showDialog(myth);
          //   },
          // ),
          onTap: () {
            controller.polyLinesCoordinates.clear();
            LatLng tappedPoint = LatLng(_story.geoPoint!.latitude, _story.geoPoint!.longitude);
            _getPolyLines(tappedPoint);
          },
          draggable: false,
          icon: BitmapDescriptor.defaultMarkerWithHue(180)),
    );
    return points;
  }

  _getPolyLines(LatLng tapped) async {
    await controller.createPolyLines(tapped);
  }

  _showDialog() {
    Get.dialog(
      AlertDialog(
        content: const Text('Presiona sobre el marcador para obtener la ruta'),
        actions: [
          CustomElevatedButton(
              color: ConstantColors.alertColor,
              onPress: () {
                Get.back();
              },
              text: 'OK'),
        ],
      ),
    );
  }
}
