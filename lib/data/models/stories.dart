import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  String? uid;
  String? name;
  GeoPoint? geoPoint;
  String? address;
  String? story;
  String? imageUrl;
  bool? active;
  String? type;

  Story({this.uid, this.name, this.geoPoint, this.address, this.story, this.imageUrl, this.active, this.type});

  factory Story.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final data = snapshot.data();
    return Story(
        uid: data?["uid"],
        name: data?["name"],
        geoPoint: data?["geoPoint"],
        address: data?["address"],
        story: data?["story"],
        imageUrl: data?["image"],
        active: data?["active"]);
  }

  Map<String, dynamic> toFirestore() => {
    if (uid != null) "uid": uid,
    if (name != null) "name": name,
    if (geoPoint != null) "geoPoint": geoPoint,
    if (address != null) "address": address,
    if (story != null) "story": story,
    if (imageUrl != null) "image": imageUrl,
    if (active != null) "active": active
  };

  @override
  String toString() {
    return 'Story{uid: $uid, name: $name, geoPoint: $geoPoint, address: $address, story: $story, imageUrl: $imageUrl, active: $active, type: $type}';
  }
}
