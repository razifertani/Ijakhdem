RegExp regExpName = RegExp(
  r'(^[a-zA-Z0-9 ]*$)',
);
RegExp regExpEmail = RegExp(
  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
);
RegExp regExpPassword = RegExp(
  r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$",
);
RegExp regExpNumber = RegExp(
  r'^\d+(?:\.\d+)?$',
);

Pattern passwordPattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
Pattern emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
Pattern namePattern = r'(^[a-zA-Z0-9 ]*$)';
Pattern specialCharacterPatter =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)';
Pattern numberPatten = r'^(?:[+0]9)?[0-9]{10}$';
Pattern onedigit = r'^(?=.*?[0-9])';
Pattern uppercasePattern = r'^(?=.*[A-Z])';
Pattern specialCaracPattern = r'^(?=.*?[!@#\$&*~]).{8,}$';

String validPassword(String value) {
  RegExp passwordRegex = new RegExp(passwordPattern);
  if (value == null)
    return '';
  else if (value.isEmpty)
    return 'Password is Required';
  else if (value.contains(' '))
    return 'Spaces not allowed';
  else if (!passwordRegex.hasMatch(value.toString()))
    return 'Enter valid password';
  else if (value.length < 7)
    return 'Password more than 8 characters';
  else
    return '';
}

String validemail(String value) {
  RegExp regex = new RegExp(emailPattern);
  if (value == null) {
    return '';
  } else if (value.isEmpty) {
    return 'Email is Required';
  } else if (!regex.hasMatch(value.toString())) {
    return 'Enter valid email';
  }
  return '';
}

String validfName(String value) {
  RegExp regex = new RegExp(namePattern);
  if (value == null) {
    return '';
  } else if (value.isEmpty) {
    return 'First Name  is Required';
  } else if (!regex.hasMatch(value.toString())) {
    return 'First Name must be letter';
  }
  return '';
}

String validlName(String value) {
  RegExp regex = new RegExp(namePattern);
  if (value == null) {
    return '';
  } else if (value.isEmpty) {
    return 'Last Name  is Required';
  } else if (!regex.hasMatch(value.toString())) {
    return 'Last Name must be letter';
  }
  return '';
}

String validnumber(String value) {
  RegExp regex = new RegExp(numberPatten);
  if (value == null) {
    return '';
  } else if (value.isEmpty) {
    return 'Serial number is Required';
  } else if (!regex.hasMatch(value.toString())) {
    return 'Enter valid number';
  }
  return '';
}
