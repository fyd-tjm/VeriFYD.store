import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFireStoreX on FirebaseFirestore {
  CollectionReference storesCollection() {
    return FirebaseFirestore.instance.collection('stores');
  }

  CollectionReference usersCollection() {
    return FirebaseFirestore.instance.collection('users');
  }

  CollectionReference ordersCollection() {
    return FirebaseFirestore.instance.collection('orders');
  }

  CollectionReference sharedInfoCollection() {
    return FirebaseFirestore.instance.collection('shared-info');
  }
}

class DbRef {
  static String getUserId() {
    // final uId = FirebaseAuth.instance.currentUser!.uid;
    const uId = '6yQEkmtw9uIed83psnEpkt6rw6AV';
    return uId;
  }

  static String getSharedInfoUserRef() {
    return 'shared-info/user';
  }

  static String getSharedInfoOrderIdsRef() {
    return 'shared-info/order-ids';
  }

  static String getCartRef() {
    return 'users/${getUserId()}/cart/0';
  }
}

class DbFKeys {
  static String cartCount() => 'cartCount';
  static String cartItems() => 'cartItems';

  static String sharedInfoTotalOrders() => 'totalOrders';

  static String userName() => 'name';
  static String userEmail() => 'email';
  static String userAddress() => 'addresses';

  static String orderCustomerInfo() => 'customerInfo';
  static String orderCustomerId() => 'customerId';
  static String orderDate() => 'orderDate';
}
