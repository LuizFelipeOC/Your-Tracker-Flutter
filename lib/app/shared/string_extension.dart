extension StringExtensions on String {
  String stripHtmlIfNeeded() {
    return replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
