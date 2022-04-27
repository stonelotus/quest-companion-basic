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
