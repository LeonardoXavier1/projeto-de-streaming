import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<LoginController>();
  }

  @override
  void dispose() {
    controller.disposeFields();
    super.dispose();
  }

  void _login() {
    if (controller.validateCredentials()) {
      Modular.to.navigate('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.userController,
              decoration: const InputDecoration(labelText: 'Usuário'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _login, child: const Text('Entrar')),
            const SizedBox(height: 12),
            AnimatedBuilder(
              animation: controller,
              builder: (_, __) {
                return controller.errorMessage != null
                    ? Text(controller.errorMessage!, style: const TextStyle(color: Colors.red))
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
