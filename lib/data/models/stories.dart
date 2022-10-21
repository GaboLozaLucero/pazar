import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Stories{
  String? uid;
  String? name;
  LatLng? latLng;
  String? direction;
  String? story;
  Image? image;

  Stories({this.uid, this.name, this.latLng, this.direction, this.story, this.image});

  factory Stories.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final data = snapshot.data();
    return Stories(
        uid: data?["uid"],
        name: data?["name"],
        latLng: data?["latLng"],
        direction: data?["direction"],
        story: data?["story"]);
  }

  Map<String, dynamic> toFirestore() => {
    if (uid != null) "uid": uid,
    if (name != null) "name": name,
    if (latLng != null) "latlng": latLng,
    if (direction != null) "direction": direction,
    if (story != null) "story": story
  };
}