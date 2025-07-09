import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_teste/app/core/constants.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final _formKey = GlobalKey<FormState>();

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
    if (_formKey.currentState!.validate()) {
      if (controller.validateCredentials()) {
        Modular.to.navigate('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/login_background.png', fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.6)),
          Center(
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(12)),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Bem-Vindo (a)',
                      style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),

                    Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: TextSelectionThemeData(
                          cursorColor: AppColors.primary,
                          selectionColor: AppColors.primary.withOpacity(0.5),
                          selectionHandleColor: AppColors.primary.withOpacity(0.5),
                        ),
                      ),
                      child: TextFormField(
                        controller: controller.userController,
                        style: const TextStyle(color: AppColors.text),
                        decoration: InputDecoration(
                          labelText: 'Email*',
                          labelStyle: const TextStyle(color: AppColors.text),
                          filled: true,
                          fillColor: Colors.white10,
                          prefixIcon: const Icon(Icons.person, color: AppColors.text),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Email inválido';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 26),

                    Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: TextSelectionThemeData(
                          cursorColor: AppColors.primary,
                          selectionColor: AppColors.primary.withOpacity(0.5),
                          selectionHandleColor: AppColors.primary.withOpacity(0.5),
                        ),
                      ),
                      child: TextFormField(
                        controller: controller.passwordController,
                        obscureText: true,
                        style: const TextStyle(color: AppColors.text),
                        decoration: InputDecoration(
                          labelText: 'Senha*',
                          labelStyle: const TextStyle(color: AppColors.text),
                          filled: true,
                          fillColor: Colors.white10,
                          prefixIcon: const Icon(Icons.lock, color: AppColors.text),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 22),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu sua senha?',
                          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.secondary,
                          textStyle: const TextStyle(fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('ENTRAR'),
                      ),
                    ),

                    const SizedBox(height: 22),

                    AnimatedBuilder(
                      animation: controller,
                      builder: (_, __) {
                        return controller.errorMessage != null
                            ? Text(controller.errorMessage!, style: const TextStyle(color: Colors.redAccent))
                            : const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
