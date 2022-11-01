class Validator {
  static bool isValidName(String name) {
    return name == null || name.length < 2;
  }

  static bool isValidPhone(String phone) {
    return phone == null ||
        phone.length != 10 ||
        phone.contains(RegExp(r'^[0-9]')) ||
        phone[0] != 0;
  }
}
