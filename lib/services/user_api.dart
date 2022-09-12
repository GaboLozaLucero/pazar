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
      // it will obtain the collection where the document will be
      CloudFirestore.DocumentReference reference = _db
          .collection(usersPath)
          // .withConverter(  it works, but created_at must be added as metadata
          //   fromFirestore: AppUser.fromFirestore,
          //   toFirestore: (AppUser appUser, options) => appUser.toFirestore(),
          // )
          .doc(appUser.uid);
      Map<String, dynamic> userToFirestore = appUser.toFirestore();
      userToFirestore.putIfAbsent('created_at', () => CloudFirestore.FieldValue.serverTimestamp());
      await reference.set(userToFirestore);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
