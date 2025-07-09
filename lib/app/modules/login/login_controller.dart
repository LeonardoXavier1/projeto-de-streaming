import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _mockUser = 'admin';
  final _mockPass = '1234';

  String? errorMessage;

  bool validateCredentials() {
    final user = userController.text.trim();
    final pass = passwordController.text.trim();

    if (user == _mockUser && pass == _mockPass) {
      errorMessage = null;
      return true;
    } else {
      errorMessage = 'Usuário ou senha inválidos';
      notifyListeners();
      return false;
    }
  }

  void disposeFields() {
    userController.dispose();
    passwordController.dispose();
  }
}
