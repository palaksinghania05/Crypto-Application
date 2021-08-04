import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DatabaseManager {
  final CollectionReference user = Firestore.instance.collection("users");

  Future<void> createUserData(String name, String email, String uid) async {
    return await user
        .document(uid).collection("userdata").document(name)
        .setData({"name": name, "email": email, "uid": uid}, merge: true);
  }

  Future<void> addCurrencies(
      String name, String price, String rank, String uid) async {
    return await user
        .document(uid)
        .collection("currencies")
        .document(rank)
        .setData({"name": name, "price": price, "rank": rank}, merge: true);
  }

  Future<void> deleteCurrencies(String rank, String uid) async {
    return await user.document(uid).collection("currencies").document(rank).delete();
  }

  Future getUserDataList() async {
    List userList = [];
    try {
      await user.getDocuments().then((QuerySnapshot snapshot) {
        snapshot.documents.forEach((DocumentSnapshot document) {
          document.reference
              .collection("userData")
              .getDocuments()
              .then((QuerySnapshot snapshot2) {
            snapshot2.documents.forEach((DocumentSnapshot userdata) {
              print(userdata.data);
              userList.add(userdata.data);
            });
          });
        });
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getSubscribedCurrencyList() async {
    List subscribedList = [];
    try {
      await user.getDocuments().then((QuerySnapshot snapshot) {
        snapshot.documents.forEach((DocumentSnapshot document) {
          subscribedList.add(document.data);
        });
      });
      return subscribedList;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<QuerySnapshot> getUsersCurrency(BuildContext context) async* {
    final userId = (await FirebaseAuth.instance.currentUser()).uid;
    yield* user.document(userId).collection('currencies').snapshots();
  }

  Stream<QuerySnapshot> getUserData(BuildContext context) async* {
    final userId = (await FirebaseAuth.instance.currentUser()).uid;
    yield* user.document(userId).collection('userdata').snapshots();
  }
}
