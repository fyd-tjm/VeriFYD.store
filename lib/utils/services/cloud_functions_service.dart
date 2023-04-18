import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CloudFunctionsService {
  final _functions = FirebaseFunctions.instance;

  // Test-Event
  Future<dynamic> testEvent() async {
    try {
      final response = await _functions.httpsCallable('checkoutEvent').call({
        'amount': 100,
        'currency': 'INR',
        'paymentType': 'UPI',
      });
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }

  // Test-2
  Future<dynamic> test2() async {
    try {
      final response = await _functions
          .httpsCallableFromUri(
        Uri.parse('http:t'),
      )
          .call({
        'amount': 100,
        'currency': 'INR',
        'paymentType': 'UPI',
      });
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }
}
