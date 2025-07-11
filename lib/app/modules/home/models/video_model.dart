class VideoModel {
  final String title;
  final String url;
  final String? thumbnail;

  VideoModel({required this.title, required this.url, this.thumbnail});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(title: json['title'] ?? 'Sem título', url: json['url'], thumbnail: json['thumbnail']);
  }

  Map<String, dynamic> toJson() => {'title': title, 'url': url, 'thumbnail': thumbnail};
}
