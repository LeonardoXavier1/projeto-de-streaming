import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_teste/app/modules/home/models/video_model.dart';

class VideoRepository {
  final String apiUrl;

  VideoRepository({required this.apiUrl});

  Future<List<VideoModel>> fetchVideos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((e) => VideoModel.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar vídeos: ${response.statusCode}');
    }
  }
}
