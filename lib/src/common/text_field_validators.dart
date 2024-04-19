abstract class TextFieldValidators {
  static const String _emailRegex =
      r'^(([^<>()\[\]\\.,;:\s@”]+(\.[^<>()\[\]\\.,;:\s@”]+)*)|(“.+”))@((\[[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}])|(([a-zA-Z\-0–9]+\.)+[a-zA-Z]{2,}))$';

  static const _userNameRegex = r'^[a-zA-Z0-9]+$';

  static bool email(String email) {
    return RegExp(
      _emailRegex,
      caseSensitive: false,
    ).hasMatch(email);
  }

  static bool userName(String userName) {
    return RegExp(
      _userNameRegex,
    ).hasMatch(userName);
  }
}
