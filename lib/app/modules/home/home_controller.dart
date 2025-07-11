import 'package:flutter/material.dart';
import 'package:projeto_teste/app/modules/home/models/video_model.dart';
import 'package:projeto_teste/app/modules/home/repositories/video_repository.dart';

class HomeController extends ChangeNotifier {
  final VideoRepository repository;

  HomeController(this.repository);
  List<VideoModel> videos = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchVideos() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      videos = await repository.fetchVideos();
    } catch (e) {
      error = 'Erro ao carregar vídeos';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
