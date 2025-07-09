import 'package:flutter/material.dart';
import 'models/video_model.dart';

class HomeController extends ChangeNotifier {
  final List<VideoModel> _videos = [
    VideoModel(
      id: '1',
      title: 'Como começar com Flutter',
      youtubeUrl: 'https://www.youtube.com/watch?v=1gDhl4leEzA',
      thumbnailUrl: 'https://img.youtube.com/vi/1gDhl4leEzA/0.jpg',
    ),
    VideoModel(
      id: '2',
      title: 'Build Layouts no Flutter',
      youtubeUrl: 'https://www.youtube.com/watch?v=CF9S4QZuV30',
      thumbnailUrl: 'https://img.youtube.com/vi/CF9S4QZuV30/0.jpg',
    ),
    VideoModel(
      id: '3',
      title: 'Flutter State Management',
      youtubeUrl: 'https://www.youtube.com/watch?v=d_m5csmrf7I',
      thumbnailUrl: 'https://img.youtube.com/vi/d_m5csmrf7I/0.jpg',
    ),
    VideoModel(
      id: '4',
      title: 'Flutter Navigation 2.0',
      youtubeUrl: 'https://www.youtube.com/watch?v=1gDhl4leEzA',
      thumbnailUrl: 'https://img.youtube.com/vi/1gDhl4leEzA/0.jpg',
    ),
    VideoModel(
      id: '5',
      title: 'Dart Programming Basics',
      youtubeUrl: 'https://www.youtube.com/watch?v=Ej_Pcr4uC2Q',
      thumbnailUrl: 'https://img.youtube.com/vi/Ej_Pcr4uC2Q/0.jpg',
    ),
    VideoModel(
      id: '6',
      title: 'Flutter Tips & Tricks',
      youtubeUrl: 'https://www.youtube.com/watch?v=1gDhl4leEzA',
      thumbnailUrl: 'https://img.youtube.com/vi/1gDhl4leEzA/0.jpg',
    ),
    VideoModel(
      id: '7',
      title: 'Como começar com Flutter',
      youtubeUrl: 'https://www.youtube.com/watch?v=1gDhl4leEzA',
      thumbnailUrl: 'https://img.youtube.com/vi/1gDhl4leEzA/0.jpg',
    ),
    VideoModel(
      id: '8',
      title: 'Build Layouts no Flutter',
      youtubeUrl: 'https://www.youtube.com/watch?v=CF9S4QZuV30',
      thumbnailUrl: 'https://img.youtube.com/vi/CF9S4QZuV30/0.jpg',
    ),
    VideoModel(
      id: '9',
      title: 'Flutter State Management',
      youtubeUrl: 'https://www.youtube.com/watch?v=d_m5csmrf7I',
      thumbnailUrl: 'https://img.youtube.com/vi/d_m5csmrf7I/0.jpg',
    ),
    VideoModel(
      id: '10',
      title: 'Flutter Navigation 2.0',
      youtubeUrl: 'https://www.youtube.com/watch?v=1gDhl4leEzA',
      thumbnailUrl: 'https://img.youtube.com/vi/1gDhl4leEzA/0.jpg',
    ),
    VideoModel(
      id: '11',
      title: 'Dart Programming Basics',
      youtubeUrl: 'https://www.youtube.com/watch?v=Ej_Pcr4uC2Q',
      thumbnailUrl: 'https://img.youtube.com/vi/Ej_Pcr4uC2Q/0.jpg',
    ),
    VideoModel(
      id: '12',
      title: 'Flutter Tips & Tricks',
      youtubeUrl: 'https://www.youtube.com/watch?v=1gDhl4leEzA',
      thumbnailUrl: 'https://img.youtube.com/vi/1gDhl4leEzA/0.jpg',
    ),
  ];

  List<VideoModel> get videos => _videos;
}
