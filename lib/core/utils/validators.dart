class Validators {
  Validators._();

  static bool isValidEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return false;
    }

    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );

    return emailRegExp.hasMatch(value.trim());
  }
}

bool isValidEmail(String? value) => Validators.isValidEmail(value);
