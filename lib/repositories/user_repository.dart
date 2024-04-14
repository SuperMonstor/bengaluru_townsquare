import 'dart:developer';
import 'dart:io';

import 'package:bengaluru_townsquare/repositories/file_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<void> createUser({Map<String, dynamic> attributes});
  Future<bool> isUniqueUsername(String username);
  Future<bool> isUserDataAvailable(String uid);
  Future<bool> isLoggedIn();
}

class FirebaseUserRepository implements UserRepository {
  @override
  Future<void> createUser({Map<String, dynamic>? attributes}) async {
    print(attributes.toString());
    String? imagePath;
    String? id;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('users').doc(attributes!["auth_id"]).set({
      'name': attributes["name"]!,
      'gender': attributes["gender"]!,
      'phone': attributes["phoneNumber"]!,
      'username': attributes["username"],
      'dob': attributes["dob"],
      'id': attributes["auth_id"],
    }).then((value) {
      id = attributes["auth_id"];
    }).catchError((e) {
      log("Error while creating the user $e");
    });

    FileRepository fileRepository = FirebaseFileRepository();
    if (attributes["profile"] != null && attributes["profile"]! != "none") {
      File image = File(attributes["profile"]);
      imagePath = await fileRepository.uploadFile(
        file: image,
        folderName: 'profile_images',
        fileName: '${id}_profile.jpg',
      );
    }

    if (imagePath != null) {
      attributes["profile"] = imagePath;
    }

    await firestore.collection('users').doc(id!).update({
      'profile': attributes["profile"],
    });

    // TODO add to state management

    // var user = user_model.User(
    //   id: id!,
    //   firstName: attributes["name"]!,
    //   gender: attributes["gender"]!,
    //   phone: attributes["phone"]!,
    //   username: attributes["username"],
    //   dob: attributes["dob"],
    //   profile: attributes["profile"],
    // );
  }

  @override
  Future<bool> isUniqueUsername(String username) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .get();
    return querySnapshot.docs.isEmpty;
  }

  @override
  Future<bool> isLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  @override
  Future<bool> isUserDataAvailable(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return snapshot.exists;
  }
}
