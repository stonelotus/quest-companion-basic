import 'package:cloud_firestore/cloud_firestore.dart';

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

Future<void> getUser() {
  var usersCollection = FirebaseFirestore.instance.collection("users");
  return usersCollection.doc("radoi_644@gmail.com").get();
}
