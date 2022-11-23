class Helpers {
//! To get Initials Of a string
  static String getInitials(String a) =>
      a.isNotEmpty ? a.trim().split(RegExp(' +')).map((s) => s[0]).join() : '';
}
