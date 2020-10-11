import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static createOrder() {
    print("abcdef");
    FirebaseFirestore.instance
        .collection("ordersCollection")
        .add({"abc": "123"}).catchError((e) {
      print(e.toString());
    });
  }
}
