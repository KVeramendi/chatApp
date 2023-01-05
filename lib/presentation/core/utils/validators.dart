class Validators {
  static String? validateEmail(String text) {
    if (text.isEmpty) {
      return 'Ingrese un correo electrónico';
    }
    const _pattern =
        r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.)*[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.[a-zA-Z0-9]{2,}$";
    if (!RegExp(_pattern).hasMatch(text)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  static String? validatePassword(String text) {
    if (text.isEmpty) {
      return 'Ingrese una contraseña';
    }
    if (text.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (!text.contains(RegExp(r'[A-Z]'))) {
      return 'La contraseña debe tener al menos 1 mayúscula';
    }
    if (!text.contains(RegExp(r'[a-z]'))) {
      return 'La contraseña debe tener al menos 1 minúscula';
    }
    if (!text.contains(RegExp(r'[0-9]'))) {
      return 'La contraseña debe tener al menos 1 dígito';
    }
    return null;
  }

  static String? validateName(String text) {
    if (text.isEmpty) {
      return 'Ingrese su nombre';
    }
    return null;
  }

  static String? validateLastName(String text) {
    if (text.isEmpty) {
      return 'Ingrese sus apellidos';
    }
    return null;
  }
}
