class Utils {
  /// convert the given email into a "Skype formatted" username.
  static String getUsername(String email) => 'live:${email.split('@')[0]}';

  /// return user's initials based on display name.
  static String getInitials(String name) {
    final list = name.split(' ');
    return '${list[0][0]}${list[1][0]}'.toUpperCase();
  }
}
