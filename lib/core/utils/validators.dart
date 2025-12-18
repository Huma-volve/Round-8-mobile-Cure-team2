class AppValidation {
  AppValidation._();

  static String? _checkNullOrEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  static String? validateRequired(
    String? value, {
    String fieldName = 'This field',
  }) {
    return _checkNullOrEmpty(value, fieldName);
  }

  static String? validatePassword(String? password) {
    final emptyCheck = _checkNullOrEmpty(password, 'Password');
    if (emptyCheck != null) return emptyCheck;

    if (!AppRegex.isValidPassword(password!)) {
      return 'Password is too weak.';
    }
    return null;
  }

  static String? validatePasswordConfirmation(
    String? password,
    String? confirmPassword,
  ) {
    final confirmCheck = _checkNullOrEmpty(confirmPassword, 'Confirm password');
    if (confirmCheck != null) return confirmCheck;

    if (password != confirmPassword) {
      return 'Passwords do not match.';
    }
    return null;
  }

  static String? validateEmail(String? email, [bool required = false]) {
    if (required == true) {
      final emptyCheck = _checkNullOrEmpty(email, 'Email address');
      if (emptyCheck != null) return emptyCheck;
    }
    if (email == null || email.trim().isEmpty) {
      return null;
    }
    final normalizedEmail = email.trim().toLowerCase();
    if (!AppRegex.isValidEmail(normalizedEmail)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validateNumber(String? phone) {
    final emptyCheck = _checkNullOrEmpty(phone, 'Mobile Number');
    if (emptyCheck != null) return emptyCheck;
    if (!AppRegex.isValidPhoneNumber(phone!)) {
      return 'Invalid phone Number';
    }
    return null;
  }
}

class AppRegex {
  AppRegex._();

  static bool isValidEmail(String email) => RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      ).hasMatch(email);
  static bool isValidPhoneNumber(
    String phone, {
    int minLength = 5,
  }) {
    phone = phone.replaceAll(' ', '');
    final regex = RegExp(r'^\d+$');
    return regex.hasMatch(phone) && phone.length >= minLength;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static bool isValidPassword(String password) {
    return /* hasLowerCase(password) &&
        hasUpperCase(password) &&
        hasNumber(password) &&
        hasSpecialCharacter(password) && */
        hasMinLength(password);
  }
}
