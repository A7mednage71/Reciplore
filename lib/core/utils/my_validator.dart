class MyValidators {
  static String? displayNamevalidator(String? value) {
    final usernameRegExp = RegExp(r'^[a-zA-Z0-9._-]+( [a-zA-Z0-9._-]+)*$');

    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    } else if (!usernameRegExp.hasMatch(value)) {
      return 'Invalid username must be at least 3+ chars:\nletters, numbers, dots, underscores, hyphens';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    final passwordRegExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be at least 8 characters\nlong and contain both letters and numbers';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value!.isEmpty) {
      return 'Please Confirm Your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? phoneNumberValidator(String? phoneNumber) {
    final phoneRegExp = RegExp(r'^(010|011|012|015)[0-9]{8}$');

    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Please enter a phone number';
    } else if (!phoneRegExp.hasMatch(phoneNumber)) {
      return 'Invalid phone number format';
    }
    return null;
  }

  static String? checkValidation({String? value, String? toBeReturnedString}) {
    if (value!.isEmpty) {
      return toBeReturnedString;
    }
    return null;
  }

  static String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final age = int.tryParse(value);

    if (age == null) {
      return 'Please enter a valid age';
    } else if (age < 0 || age > 100) {
      return 'Please enter a valid age (0-100)';
    }
    return null;
  }

  static String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    if (value.length < 5) {
      return 'Address must be at least 5 characters';
    }
    return null;
  }

  static String? searchValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a search term';
    }
    return null;
  }
}
