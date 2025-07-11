import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoDialog extends StatelessWidget {
  final String videoUrl;

  const VideoDialog({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayerController.convertUrlToId(videoUrl)!;

    final controller = YoutubePlayerController(params: const YoutubePlayerParams(showControls: true, showFullscreenButton: true))
      ..loadVideoById(videoId: videoId);

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.black,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: YoutubePlayer(controller: controller),
      ),
    );
  }
}
