class Validations {
  validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password can\'t be empty';
    } else {
      return null;
    }
  }

  validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Email is Required';
    } else if (!regExp.hasMatch(value.trim())) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }
}
