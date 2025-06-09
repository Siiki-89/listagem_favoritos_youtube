class VideoData {
  VideoData({
    required this.thumbnail,
    required this.title,
    required this.channelName,
    required this.channelURL,
  });

  final String thumbnail;
  final String title;
  final String channelName;
  final String channelURL;

  Map<String, dynamic> toMap() {
    return {
      'imagem': thumbnail,
      'titulo': title,
      'canal': {'nome': channelName, 'url': channelURL},
    };
  }
}
