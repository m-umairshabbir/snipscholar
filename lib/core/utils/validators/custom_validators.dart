  class Validators {
    static String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }

      const emailPattern =
          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
      final regex = RegExp(emailPattern);

      if (!regex.hasMatch(value.trim())) {
        return 'Enter a valid email';
      }

      return null; // Valid
    }

  // You can add other validators here too:
  // static String? validatePassword(String? value) { ... }

    static String? validateName(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Name is required';
      }

      // Optional: Check for at least 2 characters and only letters/spaces
      final nameRegExp = RegExp(r"^[a-zA-Z\s]{2,}$");

      if (!nameRegExp.hasMatch(value.trim())) {
        return 'Enter a valid name ';
      }

      return null; // valid
    }

    static String? validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }

      if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }

      // Optional: Enforce strong password rules
      final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]+$');
      if (!regex.hasMatch(value)) {
        return 'Password must include upper, lower, and number';
      }

      return null; // valid
    }
    static String? validateConfirmPassword(String? value, String password) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password';
      }

      if (value != password) {
        return 'Passwords do not match';
      }

      return null; // valid
    }

  }
