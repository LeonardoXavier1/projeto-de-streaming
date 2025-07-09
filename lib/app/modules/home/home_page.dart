import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8),
          content: YoutubePlayerScaffold(
            controller: playerController,
            builder: (context, player) => SizedBox(width: 560, height: 315, child: player),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final videos = controller.videos;

    return Scaffold(
      appBar: AppBar(title: const Text('Seleção de Vídeos')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: videos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemBuilder: (_, index) {
            final video = videos[index];

            return GestureDetector(
              onTap: () => _openVideoDialog(video),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: NetworkImage(video.thumbnailUrl), fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  width: double.infinity,
                  color: Colors.black54,
                  child: Text(
                    video.title,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
