import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_controller.dart';
import 'models/video_model.dart';

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
  }

  void _openVideoDialog(VideoModel video) {
    final videoId = YoutubePlayerController.convertUrlToId(video.youtubeUrl);
    if (videoId == null) return;

    final playerController = YoutubePlayerController(params: const YoutubePlayerParams(showControls: true, showFullscreenButton: true));

    playerController.loadVideoById(videoId: videoId);

    showDialog(
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        final dialogWidth = size.width * 0.8;
        final dialogHeight = size.height * 0.8;

        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: dialogWidth,
            height: dialogHeight,
            child: YoutubePlayerScaffold(
              controller: playerController,
              builder: (context, player) => ClipRRect(borderRadius: BorderRadius.circular(12), child: player),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final videos = controller.videos;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/login_background.png'), fit: BoxFit.cover),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'O que deseja assistir?',
                    style: GoogleFonts.exo2(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      shadows: const [Shadow(offset: Offset(2, 2), blurRadius: 4, color: Colors.black54)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 1000,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.45), borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.all(12),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: videos.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (_, index) {
                            final video = videos[index];
                            return GestureDetector(
                              onTap: () => _openVideoDialog(video),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.network(video.thumbnailUrl, fit: BoxFit.cover),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                        color: Colors.black87,
                                        child: Text(
                                          video.title,
                                          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
