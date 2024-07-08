class AppUrl {
  String get url => _getURL();

  static const String _baseUrl = String.fromEnvironment('base_url');
  static const String _getUser = String.fromEnvironment('user_api');
  static const String _getToken = String.fromEnvironment('key_api');

  String _getURL() {
    return '$_baseUrl?user=$_getUser&token=$_getToken';
  }
}
