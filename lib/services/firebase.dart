import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quest_companion/services/service_locator.dart';
import 'package:quest_companion/services/user_service/user_service.dart';

Future<void> writeUser(user) {
  var usersCollection = FirebaseFirestore.instance.collection("users");
  print("User email: " + user["email"]);
  print(user);
  return usersCollection
      .doc(user["email"])
      .set(user)
      .then((value) => print("Update user done!"))
      .catchError((error) => print("Error updating user" + error.toString()));
}

Future<void> updateUser(user) {
  var usersCollection = FirebaseFirestore.instance.collection("users");

  return usersCollection.doc("radoi644@gmail.com").update(user);
}

Future<dynamic> getUser() async {
  var usersCollection = FirebaseFirestore.instance.collection("users");
  var docSnapshot = await usersCollection.doc('radoi644@gmail.com').get();
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data();
    var value = data?['streak']; // <-- The value you want to retrieve.
    debugPrint(value.toString());
    getIt<UserService>().setCachedStreak(value);
    return value;
  }
}
