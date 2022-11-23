import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFireStoreX on FirebaseFirestore {
  CollectionReference storesCollection() {
    return FirebaseFirestore.instance.collection('stores');
  }

  CollectionReference sharedInfoCollection() {
    return FirebaseFirestore.instance.collection('shared-user-info');
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get productCollection => collection('products');
}
