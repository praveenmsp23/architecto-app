import '../models/common.dart';

Result<String> checkPasswordStrength(String password) {
  if (password.isEmpty) {
    return Result(false, 'Please enter a password', null);
  } else if (password.length < 8) {
    return Result(false, 'Password is too short', null);
  } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return Result(false, 'Use at least one uppercase letter', null);
  } else if (!RegExp(r'[a-z]').hasMatch(password)) {
    return Result(false, 'Use at least one lowercase letter', null);
  } else if (!RegExp(r'[0-9]').hasMatch(password)) {
    return Result(false, 'Use at least one number', null);
  } else {
    return Result(true, '', password);
  }
}
