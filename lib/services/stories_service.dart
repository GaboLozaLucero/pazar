import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart' as CloudFirestore;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/data/models/stories.dart';

class StoriesService {
  final CloudFirestore.FirebaseFirestore _db = CloudFirestore.FirebaseFirestore.instance;
  static const String collectionPath = 'stories';

  Future<String> uploadPortrait(String imageName, File filePath) async {
    try {
      Reference reference = FirebaseStorage.instance.ref();
      Reference referenceDirImages = reference.child('images');
      Reference referenceUploadImage = referenceDirImages.child(imageName); //
      // creates a reference where the image will be stored
      await referenceUploadImage.putFile(filePath);
      return await referenceUploadImage.getDownloadURL();
    } catch (e) {
      log('this is an error ${e.toString()}');
      return './././assets/images/default_image.png';
    }
  }

  Future<bool> saveStory(Story story) async {
    try {
      CloudFirestore.DocumentReference reference = _db.collection(story.type!).doc(story.id);
      Map<String, dynamic> storyToFirestore = story.toFirestore();
      storyToFirestore.putIfAbsent('created_at', () => CloudFirestore.FieldValue.serverTimestamp());
      await reference.set(storyToFirestore);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<Story>?> retrieveStoriesByType(String type) async {
    try {
      //only retrieve stories that admin set as active
      final storiesQuery = await _db
          .collection(collectionPath)
          .where('active', isEqualTo: true).where('type', isEqualTo: type)
          .get();
      // log('stories: ${storiesQuery.docs.map((story) => Story.fromFirestore(story, null)).toList()}');
      return storiesQuery.docs.map((story) => Story.fromFirestore(story, null)).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}