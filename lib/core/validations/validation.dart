import 'regex_validation.dart';

class Validation {
  static String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty.";
    }
    if (value.length <= 2) {
      return "Username should be at least 3 characters long.";
    }
    if (value.length > 40) {
      return "Username cannot exceed 40 characters.";
    }
    if (!RegexValidation.isUsernameValid(value)) {
      return "Please enter a valid username.";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email address is required.';
    }
    if (!RegexValidation.isEmailValid(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    if (value.length < 9 || value.length > 20) {
      return 'Please enter a valid phone number.';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 8) {
      return 'Password should be at least 8 characters long.';
    }
    return null;
  }

  static String? passwordConfirmValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Password confirmation is required.';
    }
    if (value != password) {
      return 'Passwords do not match.';
    }
    return null;
  }

  static String? loginPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 8) {
      return 'Password should be at least 8 characters long.';
    }
    return null;
  }

  static String? validatePhoneOrEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your email or phone number';
    }

    final emailRegex =
    RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    final phoneRegex = RegExp(r"^\+?[0-9]{10,15}$");

    if (emailRegex.hasMatch(input)) {
      return null; // Valid email
    } else if (phoneRegex.hasMatch(input)) {
      return null; // Valid phone number
    } else {
      return 'Please enter a valid email or phone number';
    }
  }

  static String? cardNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number is required.';
    }
    if (!RegexValidation.isVisaCardNumberValid(value)) {
      return 'Please enter a valid Visa card number.';
    }
    return null;
  }

  // Validate Expiration Date
  static String? expirationDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiration date is required.';
    }
    if (!RegexValidation.isExpirationDateValid(value)) {
      return 'Please enter a valid expiration date (MM/YY).';
    }
    return null;
  }

  // Validate CVV
  static String? cvvValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required.';
    }
    if (!RegexValidation.isCvvValid(value)) {
      return 'Please enter a valid CVV (3 digits).';
    }
    return null;
  }

  // Validate Cardholder Name
  static String? cardholderNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Cardholder name is required.';
    }
    if (!RegexValidation.isCardholderNameValid(value)) {
      return 'Please enter a valid cardholder name (letters and spaces only).';
    }
    return null;
  }
}