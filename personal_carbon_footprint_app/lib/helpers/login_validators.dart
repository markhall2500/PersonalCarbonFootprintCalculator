
class LoginValidators {
  //Private constructor to prevent instantiation
  LoginValidators._();

    static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty || value == 'Please enter a username') {
      return 'Please enter your username';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty || value == 'Please enter a password') {
      return 'Please enter your password';
    }
    return null;
  }
}
