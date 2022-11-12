// ignore_for_file: library_prefixes

import 'dart:developer';

import 'package:project/data/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as CloudFirestore;

class UserService {
  final CloudFirestore.FirebaseFirestore _db = CloudFirestore.FirebaseFirestore.instance;

  static const String usersPath = 'users';

  Future<AppUser?> getUserByUid(String uid) async {
    try {
      //this will search the user's uid in the users collection
      final userSnapshot = await _db
          .collection(usersPath)
          .doc(uid)
          .withConverter(
            fromFirestore: AppUser.fromFirestore,
            toFirestore: (AppUser appUser, options) => appUser.toFirestore(),
          )
          .get();
      if (userSnapshot != null) {
        //data() converts DocumentSnapshot into a AppUser object
        final user = userSnapshot.data();
        return user;
      } else {
        return null;
      }
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
          //withConverter will no be used, because another metadata field must be added
          // .withConverter(  it works, but created_at must be added as metadata
          //   fromFirestore: AppUser.fromFirestore,
          //   toFirestore: (AppUser appUser, options) => appUser.toFirestore(),
          // )
          .doc(appUser.uid);
      Map<String, dynamic> userToFirestore = appUser.toFirestore();
      //serverTimestamp is used because provides UTC-4 for any device despite their local time
      userToFirestore.putIfAbsent('created_at', () => CloudFirestore.FieldValue.serverTimestamp());
      await reference.set(userToFirestore);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> updateUser(AppUser appUser) async {
    try {
      CloudFirestore.DocumentReference reference = _db.collection(usersPath).doc(appUser.uid);
      await _db.runTransaction(
        (transaction) => transaction.get(reference).then(
              (value) => transaction.update(reference, {"name": appUser.name, "lastname": appUser.lastname}),
            ),
      );
      return true;
    } catch (e) {
      log('error updating user');
      return false;
    }
  }
}
