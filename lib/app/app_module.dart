import 'package:flutter_modular/flutter_modular.dart';
import 'modules/login/login_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
    r.module('/home', module: HomeModule());
  }
}
