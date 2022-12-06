class Helpers {
//! To get Initials Of a string
  static String getInitials(String a) =>
      a.isNotEmpty ? a.trim().split(RegExp(' +')).map((s) => s[0]).join() : '';

  static String phoneMask(String number) {
    final expr = RegExp(r'(\d{4})(\d{3})(\d+)');
    return number.replaceAllMapped(
        expr, (Match m) => "(${m[1]})-${m[2]}-${m[3]}");
  }
}
