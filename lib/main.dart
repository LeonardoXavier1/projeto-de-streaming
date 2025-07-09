import 'package:flutter/material.dart';
import 'package:projeto_teste/app/core/controllers/app_controller.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppController())],
      child: ModularApp(module: AppModule(), child: const AppWidget()),
    ),
  );
}
