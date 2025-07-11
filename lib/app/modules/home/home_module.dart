import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';
import 'home_controller.dart';
import 'repositories/video_repository.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<VideoRepository>(() => VideoRepository(apiUrl: 'https://mocki.io/v1/4d78523e-5b9c-4c2e-b571-d11f1f51c15a'));
    i.add(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
  }
}
