import '/modules/shared/validators.dart';

class Email {
  Email(String value) : _value = value {
    String email = value.trim().toLowerCase();

    if (!validateEmailAddress(email)) {
      throw Exception("Email format not valid");
    }
  }

  final String _value;

  String get value => _value;

  static isValidEmail(String email) {
    return validateEmailAddress(email);
  }
}

// class Password {
//   Password(String value) : _value = value {
//     if (value.length < minLength) {
//       throw Exception("Password $value has less than $minLength characters");
//     } else if (value.length > maxLength) {
//       throw Exception("Password $value has more than $maxLength characters");
//     }
//   }

//   static final maxLength = 30;
//   static final minLength = 8;
//   final String _value;

//   String get value => _value;
// }
