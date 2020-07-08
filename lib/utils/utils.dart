class Utils {
  /// convert the given email into a "Skype formatted" username.
  static String getUsername(String email) => 'live:${email.split('@')[0]}';
}
