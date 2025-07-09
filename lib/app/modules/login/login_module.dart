import 'package:flutter_modular/flutter_modular.dart';
import 'login_page.dart';
import 'login_controller.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.add(LoginController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
