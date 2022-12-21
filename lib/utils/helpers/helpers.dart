import 'dart:ui';

import '../../00 ui-core/core/fyd_colors.dart';

class Helpers {
//! To get Initials Of a string
  static String getInitials(String a) =>
      a.isNotEmpty ? a.trim().split(RegExp(' +')).map((s) => s[0]).join() : '';

//! PhoneMask (XXXX)-XXX-XXX
  static String phoneMask(String number) {
    final expr = RegExp(r'(\d{4})(\d{3})(\d+)');
    return number.replaceAllMapped(
        expr, (Match m) => "(${m[1]})-${m[2]}-${m[3]}");
  }

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

  static Color getContrastColor(Color? color) {
    if (color == null) return fydPDgrey;
    if (color == fydSBlue) {
      return fydSCBlue;
    } else if (color == fydSPink) {
      return fydSCPink;
    } else if (color == fydSYellow) {
      return fydSCYellow;
    } else {
      return fydPDgrey;
    }
  }
}
