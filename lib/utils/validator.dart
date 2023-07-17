import 'package:flutter/services.dart';

class Validator {
  static String? valueExists(dynamic value) {
    if (value == null || value.isEmpty) {
      return '';
    } else {
      return null;
    }
  }

  static String? passwordCorrect(dynamic value) {
    var emptyResult = valueExists(value);
    if (emptyResult == null || emptyResult.isEmpty) {
      var pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[#?!@$%^&*-]).{8,}$';
      var regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Your password must be at least 8 symbols with number, big and small letter and special character (!@#\$%^&*).';
      } else if (regExp.hasMatch(value)) {
        return 'Nice work. This is an excellent password';
      }
      {
        return null;
      }
    } else {
      return emptyResult;
    }
  }

  static String? pinValid(dynamic value) {
    var pattern = r'^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}$';
    var regExp = RegExp(pattern);
    if (regExp.hasMatch(value)) {
      return 'ss';
    } else {
      return null;
    }
  }

  static String? validateEmail(dynamic value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regExp = RegExp(pattern);
    var emptyResult = valueExists(value);
    if (emptyResult != null) {
      return emptyResult;
    } else if (!regExp.hasMatch(value)) {
      return 'Not a valid email address. Should be your@email.com';
    } else {
      return null;
    }
  }
}

class Validator2 {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      print("$value");
      return 'Enter your Email';
      // return '\u26A0 Please enter your email';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Enter the Password';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.length < 3) {
      return '🚩 Note is too short.';
    } else {
      return null;
    }
  }

  static String? validateText(String value) {
    if (value.isEmpty) {
      return '🚩 Text is too short.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    final RegExp regex = RegExp(r'^[0-9]{9}$');
    if (!regex.hasMatch(value)) {
      return 'Enter the Correct Phone Number ';
    } else {
      return null;
    }
  }

  /// TODO: Edit this for Not Valid
  static String? validateID(String value) {
    if (value.length == 9) {
      return 'Phone ID is not valid.';
    } else {
      return null;
    }
  }

  static String? validateMasterCardNumber(String value) {
    if (value.length != 16) {
      return '🚩 MasterCard Number is not valid.';
    } else {
      return null;
    }
  }

  static String? validatCVV(String value) {
    if (value.length != 4) {
      return '🚩 CVV is not valid.';
    } else {
      return null;
    }
  }

  static String? validatOTP(String value) {
    if (value.length != 6 && value.trim().isEmpty && value is int) {
      return 'Should be 6 digits';
    } else {
      return null;
    }
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
