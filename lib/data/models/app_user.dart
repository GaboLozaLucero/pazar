import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String? uid;
  String? name;
  String? lastname;
  String? email;
  bool? active;

  AppUser({this.uid, this.name, this.lastname, this.email, this.active});

  factory AppUser.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final data = snapshot.data();
    return AppUser(
        uid: data?["uid"], name: data?["name"], lastname: data?["lastname"], email: data?["email"], active: data?["active"]);
  }

  Map<String, dynamic> toFirestore() => {
        if (uid != null) "uid": uid,
        if (name != null) "name": name,
        if (lastname != null) "lastname": lastname,
        if (email != null) "email": email,
        if (active != null) "active": active
      };

  @override
  String toString() {
    return 'AppUser{uid: $uid, name: $name, lastname: $lastname, email: $email, active: $active}';
  }
}
