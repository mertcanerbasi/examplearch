String? validateEmail(String? str) {
  if (str == null || str.isEmpty) {
    return "• Lütfen email giriniz.";
  } else if (str.isNotEmpty) {
    bool rex = RegExp(
            r"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
        .hasMatch(str);
    return rex ? null : "• Lütfen geçerli email giriniz.";
  }
  return null;
}

int checkEmailString(String value) {
  final splitted = value.split('@');

  //eposta @ ile birlikte minimum 6 karakter olmalı
  if (value.length < 6) {
    return 1;
  }

  //@”ten önce minimum karakter
  if (splitted[0].length < 2) {
    return 2;
  } else {
    return 0;
  }
}
