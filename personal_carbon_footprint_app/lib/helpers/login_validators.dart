
class LoginValidators {
  //Private constructor to prevent instantiation
  LoginValidators._();

  //Username validator method
  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty || value == 'Please enter a username') {
      return 'Please enter your username';
    }
    return null;
  }

  //Password validator method
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty || value == 'Please enter a password') {
      return 'Please enter your password';
    }
    return null;
  }
}
