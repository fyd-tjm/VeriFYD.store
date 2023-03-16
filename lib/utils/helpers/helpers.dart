import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';

import '../../00 ui-core/core/fyd_colors.dart';

class Helpers {
//?-----------------------------------------------------------------------------

//?-----------------------------------------------------------------------------
  //! generate db paths/references
  static String getProductsCollectionRef({required String storeId}) {
    return 'stores/$storeId/products';
  }

  static String getProductRef(
      {required String storeId, required String skuId}) {
    return 'stores/$storeId/products/$skuId';
  }

  static String getStoreRef({required String storeId}) {
    return 'stores/$storeId';
  }

  static String getCartRef({required String userId}) {
    return 'stores/$userId/cart/0';
  }

//?-----------------------------------------------------------------------------
  //! Launch Link

  static Future<void> launchLink({required String url}) async {
    final Uri launchUri = Uri.parse(url);

    await launchUrl(launchUri, mode: LaunchMode.externalApplication);
  }

//?-----------------------------------------------------------------------------
  //! Launch whatsApp

  static Future<void> launchWhatsApp({required String phone}) async {
    final Uri launchUri = Uri.parse(
      'https://wa.me/$phone',
    );
    await launchUrl(launchUri, mode: LaunchMode.externalApplication);
  }

//?-----------------------------------------------------------------------------
  //! Launch Phone

  static Future<void> launchPhone({required String phone}) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
  }

//?-----------------------------------------------------------------------------
  //! Launch Mail

  static Future<void> launchMail(
      {required String email, required String subject}) async {
    //--------
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    //--------
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': subject,
      }),
    );
    //--------
    await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
    //-------
  }

//?-----------------------------------------------------------------------------
//! to check if list<String> has entry in Map<String, dynamic>

  static bool checkEntries(List<String> list, Map<String, dynamic> map) {
    for (String s in list) {
      if (!map.containsKey(s)) {
        return false;
      }
    }
    return true;
  }

//?-----------------------------------------------------------------------------
//! email Regex

  static bool isValidEmail(String email) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

//?-----------------------------------------------------------------------------
//! To get Initials Of a string

  static String getInitials(String a) =>
      a.isNotEmpty ? a.trim().split(RegExp(' +')).map((s) => s[0]).join() : '';

//?-----------------------------------------------------------------------------
//! PhoneMask without Country-Code (XXXX)-XXX-XXX

  static String phoneMask(String number) {
    final expr = RegExp(r'(\d{4})(\d{3})(\d+)');
    return number.replaceAllMapped(
        expr, (Match m) => "(${m[1]})-${m[2]}-${m[3]}");
  }

//?-----------------------------------------------------------------------------
//! To get last 10 digits from a String

  static String getLast10Digits(String input) {
    // Use a regular expression to find all digits in the string
    Iterable<RegExpMatch> matches = RegExp(r'\d').allMatches(input);
    // Convert the iterable to a list
    List<String?> digits = matches.map((m) => m.group(0)).toList();
    // If there are fewer than 10 digits, return all of them
    if (digits.length < 10) {
      return digits.join();
    }
    // Otherwise, return the last 10 digits
    return digits.sublist(digits.length - 10).join();
  }

//?-----------------------------------------------------------------------------
//! PhoneMask with Country-Code +XX (XXXX)-XXX-XXX

  static String phoneMaskWithCountryCode(String number) {
    final expr = RegExp(r'(\d{2})(\d{4})(\d{3})(\d+)');
    return number.replaceAllMapped(
        expr, (Match m) => "${m[1]} (${m[2]})-${m[3]}-${m[4]}");
  }

//?-----------------------------------------------------------------------------
  //! To Title Case

  static String toTitleCase(String str) {
    final words = str.split(' ');
    for (int i = 0; i < words.length; i++) {
      final word = words[i];
      final firstLetter = word[0].toUpperCase();
      final restOfWord = word.substring(1);
      words[i] = '$firstLetter$restOfWord';
    }
    return words.join(' ');
  }

//?-----------------------------------------------------------------------------
  //! PascalCase

  static String? toPascalCase(String? input) {
    // Split the input string into a list of words
    if (input == null) {
      return null;
    }
    List<String> words = input.split(" ");

    // Create a new, empty string to hold the Pascal-cased result
    String result = "";

    // Loop through the list of words
    for (var word in words) {
      // Capitalize the first letter of each word and add it to the result
      result += word[0].toUpperCase() + word.substring(1);
    }

    // Return the result
    return result;
  }

//?-----------------------------------------------------------------------------
//! Sorting Map based on Keys

  static Map sortMapByKeys(Map map) {
    // First, create a list of the map's keys
    List keys = map.keys.toList();

    // Then, sort the list of keys
    keys.sort((a, b) => a.compareTo(b));

    // Create a new, empty map
    Map sortedMap = {};

    // Loop through the sorted list of keys
    for (var key in keys) {
      // For each key, add the key-value pair from the original map to the new, sorted map
      sortedMap[key] = map[key];
    }

    // Finally, return the sorted map
    return sortedMap;
  }

//?-----------------------------------------------------------------------------
  //! Sorting Map based on values

  static Map sortMapByValues(Map map) {
    var entries = map.entries.toList();

// Sort the list by the values of the entries
    entries.sort((a, b) => a.value.compareTo(b.value));

// Create a new map from the sorted list
    var sortedMap = Map.fromEntries(entries);
    // Finally, return the sorted map
    return sortedMap;
  }

//?-----------------------------------------------------------------------------

//?-----------------------------------------------------------------------------
//! Map to String
  static String mapToString(Map<String, String> map) {
    return jsonEncode(map);
  }

//?-----------------------------------------------------------------------------
//! Generates a List of all n-digit numbers
//------------------

  static List<int> generateNumbersOfNDigit(int n) {
    return List.generate(
        9 * (pow(10, n - 1).toInt()), (i) => (pow(10, n - 1).toInt()) + i);
  }

//?-----------------------------------------------------------------------------
  //! Generate a list of storeId/skuId
  //-----------------------
  static List<String> generateStoreOrSkuIdList(
      List<String> prefixList, int numberOfIdDigits) {
    // generate n-digit int list
    final idList = Helpers.generateNumbersOfNDigit(numberOfIdDigits);
    // add prefix to list element
    var finalList = <String>[];
    for (var prefix in prefixList) {
      var idListforPrefix = <String>[];
      for (var id in idList) {
        final finalId = '#$prefix$id';
        idListforPrefix.add(finalId);
      }
      idListforPrefix.shuffle();
      finalList.addAll(idListforPrefix);
    }
    return finalList;
  }

//?-----------------------------------------------------------------------------
//! Generate a list of OrderId for Given Prefix [A-04323...., A-12324....., B-0XXXX..B-4XXXX, C-0XXXX]
  //-----------------------
  static List<String> createPrefixList() {
    const alphabetString = 'ABCDEFGHIJKLMNPQRSTUVWXYZ';
    List<String> formattedList = [];
    for (var i = 0; i < alphabetString.length; i++) {
      for (var j = 0; j < 5; j++) {
        formattedList.add('${alphabetString[i]}-$j');
      }
    }
    return formattedList;
  }

  //-----------------------

  static List<String> generateOrderIdList(
      List<String> prefixList, int numberOfIdDigits) {
    // generate n-digit int list
    final idList = Helpers.generateNumbersOfNDigit(numberOfIdDigits);
    // add prefix to list element
    var finalList = <String>[];
    for (var prefix in prefixList) {
      var orderIdListforPrefix = <String>[];
      for (var id in idList) {
        final orderId = '$prefix$id';
        orderIdListforPrefix.add(orderId);
      }
      orderIdListforPrefix.shuffle();
      finalList.addAll(orderIdListforPrefix);
    }
    return finalList;
  }

//?-----------------------------------------------------------------------------
}
