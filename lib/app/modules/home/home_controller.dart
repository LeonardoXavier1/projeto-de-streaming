import 'package:flutter/material.dart';
import 'models/video_model.dart';

class HomeController extends ChangeNotifier {
  final List<VideoModel> _videos = [
    VideoModel(
      id: '1',
      title: 'Flutter Layout',
      thumbnailUrl: 'https://img.youtube.com/vi/x0uinJvhNxI/0.jpg',
      youtubeUrl: 'https://www.youtube.com/watch?v=x0uinJvhNxI',
    ),
    VideoModel(
      id: '2',
      title: 'Dart Basics',
      thumbnailUrl: 'https://img.youtube.com/vi/Ej_Pcr4uC2Q/0.jpg',
      youtubeUrl: 'https://www.youtube.com/watch?v=Ej_Pcr4uC2Q',
    ),
    VideoModel(
      id: '3',
      title: 'State Management',
      thumbnailUrl: 'https://img.youtube.com/vi/nnnIRZkW5wQ/0.jpg',
      youtubeUrl: 'https://www.youtube.com/watch?v=nnnIRZkW5wQ',
    ),
    VideoModel(
      id: '4',
      title: 'Flutter Modular',
      thumbnailUrl: 'https://img.youtube.com/vi/5R2Uw_kU_iI/0.jpg',
      youtubeUrl: 'https://www.youtube.com/watch?v=5R2Uw_kU_iI',
    ),
    // Adicione mais se quiser...
  ];

  List<VideoModel> get videos => _videos;
}
