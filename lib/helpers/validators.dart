import 'package:email_validator/email_validator.dart';

String? validateName(String? value) {
  if(value == null || value.isEmpty) {
    return "Username cannot be empty";
  }
  return null;
}

String? validateUsername(String? value) {
  if(value == null || value.isEmpty) {
    return "Username cannot be empty";
  }
  return null;
}

String? validatePassword(String? value) {
  if(value == null || value.isEmpty) {
    return "Password cannot be empty";
  }
  return null;
}

String? validateEmail(String? value) {
  return EmailValidator.validate(value ?? "") ? null : "Invalid email";
}

String? validatePhonenumber(String? value) {
  if(value == null || value.isEmpty) {
    return "Phonenumber cannot be empty";
  }
  return null;
}