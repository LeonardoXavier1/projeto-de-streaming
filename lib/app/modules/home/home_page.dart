import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_teste/app/modules/home/widgets/video_dialog.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<HomeController>();
    controller.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/login_background.png', fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.8)),

          Column(
            children: [
              const SizedBox(height: 60),
              Text(
                'O que deseja assistir ?',
                style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) {
                    if (controller.isLoading) {
                      return const Center(child: CircularProgressIndicator(color: Colors.white));
                    } else if (controller.error != null) {
                      return Center(
                        child: Text(controller.error!, style: const TextStyle(color: Colors.redAccent)),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          itemCount: controller.videos.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 9 / 14,
                          ),
                          itemBuilder: (_, index) {
                            final video = controller.videos[index];
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => VideoDialog(videoUrl: video.url),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.network(
                                      video.thumbnail ?? '',
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => Container(
                                        color: Colors.grey,
                                        child: const Icon(Icons.error, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          video.title,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
