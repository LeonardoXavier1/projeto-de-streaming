import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_teste/app/modules/home/home_module.dart';
import 'package:projeto_teste/app/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
    r.module('/home', module: HomeModule());
  }
}
