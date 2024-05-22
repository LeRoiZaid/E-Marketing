class MyValidation {
  String? nameValidate(String? input) {
     bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input??"");
    return emailValid == true ? null : "invalid email";
  }
  String? passwordValidate(String? value) {
    bool passwordvalid = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'  )
        .hasMatch(value??"");
    return passwordvalid == true ? null : "invalid password";

    
  }
    String? VerficationCode(String? value) {
       if (value == null || value.isEmpty) {
                    return 'Please enter the verification code.';
                  } else if (value.length != 6) {
                    return 'Verification code must be 6 digits.';
                  }
                  return null;

}String? validateAge(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your age';
  }
  int? age = int.tryParse(value);
  if (age == null) {
    return 'Please enter a valid number';
  }
  if (age < 18) {
    return 'Age must be 18 or mor';
  }
  return null;
}

}