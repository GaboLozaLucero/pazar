import 'dart:developer';

import 'package:project/data/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as CloudFirestore;

class UserAPI {
  final CloudFirestore.FirebaseFirestore _db = CloudFirestore.FirebaseFirestore.instance;

  static const String usersPath = 'users';

  Future<AppUser?> getUserByEmail(String email) async {
    try {
      email = email.toLowerCase();
      final CloudFirestore.DocumentSnapshot userSnapshot = await _db.collection(usersPath).doc().get();
      if (userSnapshot != null || userSnapshot.exists) {
        final data = userSnapshot.data() as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> createUser(AppUser appUser) async {
    try {
      CloudFirestore.DocumentReference reference = _db.collection(usersPath).doc(appUser.uid);
      Map<String, dynamic> userJson = appUser.toFirestore();
      final currentTime = CloudFirestore.FieldValue.serverTimestamp();
      userJson.putIfAbsent('created_at', () => currentTime);
      //log(appUser.name.toString());
      await reference.set(userJson);
      return true;
    } catch (e) {
      return false;
    }
  }
}
