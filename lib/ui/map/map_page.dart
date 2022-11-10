import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/controllers/map_controller.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/appbar/custom_appbar.dart';
import 'package:project/ui/widgets/button/custom_elevatedbutton.dart';
import 'dart:developer';
import 'package:project/ui/widgets/button/floating_story_button.dart';
import 'package:project/ui/widgets/loading/circular_loading_indicator.dart';

class MapPage extends GetView<MapController> {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MapController>(
      initState: (state) async {
        await controller.getStories();
        await controller.getUserLocation();
        log('this is my current location when pages inits: ${controller.locationPosition.latitude} ${controller.locationPosition.longitude}');
      },
      builder: (_) {
        if (_.isLoading1) {
          return const CircularLoadingIndicator(text: 'Cargando mapa',
          );
        } else {
          Set<Polyline> polys = {};
          polys.add(Polyline(
              polylineId: PolylineId('poly id'),
              points: controller.polyLinesCoordinates,
              color: Colors.blue,
              width: 3,
              consumeTapEvents: true,
              endCap: Cap.roundCap));
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
                    polylines: polys,
                    markers: _getMarkers(),
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              children: [
                FloatingStoryButton(
                  iconData: Icons.my_location,
                  function: () {
                    log('this is pressed');
                    controller.currentLocation();
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Set<Marker> _getMarkers() {
    Set<Marker> points = new Set();
    if (controller.myths.isNotEmpty || controller.legends.isNotEmpty) {
      for (var myth in controller.myths) {
        points.add(
          Marker(
              markerId: MarkerId(myth.name!),
              position: LatLng(myth.geoPoint!.latitude, myth.geoPoint!.longitude),
              anchor: const Offset(0.5, 0.5),
              // infoWindow: InfoWindow(
              //   title: '${myth.address}',
              //   onTap: () {
              //     _showDialog(myth);
              //   },
              // ),
              onTap: () {
                _showDialog(myth);
              },
              draggable: false,
              icon: BitmapDescriptor.defaultMarkerWithHue(180)),
        );
      }
      for (var legend in controller.legends) {
        points.add(Marker(
          markerId: MarkerId(legend.name!),
          position: LatLng(legend.geoPoint!.latitude, legend.geoPoint!.longitude),
          anchor: const Offset(0.5, 0.5),
          // infoWindow: InfoWindow(
          //   title: '${legend.address}',
          //   onTap: () {
          //     _showDialog(legend);
          //   },
          // ),
          onTap: () {
            _showDialog(legend);
          },
          draggable: false,
          icon: BitmapDescriptor.defaultMarker,
        ));
      }
    }
    return points;
  }

  _showDialog(Story story) {
    Get.dialog(
      AlertDialog(
        title: Text('${story.name}', textAlign: TextAlign.center),
        content: SizedBox(
          height: Get.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: Get.height * 0.2,
                  width: double.infinity,
                  child: Image.network(
                    '${story.imageUrl}',
                    fit: BoxFit.fill,
                  )),
              CustomElevatedButton(
                color: ConstantColors.textTitleStoryColor,
                onPress: () {
                  Get.back();
                  Get.toNamed(Routes.story, arguments: story);
                },
                text: 'Más información',
              ),
              CustomElevatedButton(
                color: ConstantColors.mapIconColor,
                onPress: () {
                  controller.polyLinesCoordinates.clear();
                  Get.back();
                  LatLng tappedPoint = LatLng(story.geoPoint!.latitude, story.geoPoint!.longitude);
                  _getPolyLines(tappedPoint);
                },
                text: 'Crear ruta',
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: ConstantColors.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Salir',
              style: textCardStories,
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeForm.dialogRadius),
        ),
      ),
      barrierDismissible: false,
    );
  }

  _getPolyLines(LatLng tapped) async {
    await controller.createPolyLines(tapped);
  }
}
