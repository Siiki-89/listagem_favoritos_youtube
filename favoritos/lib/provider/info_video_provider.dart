import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/model/video_model.dart';
import 'package:listagem_favoritos_youtube/service/video_service.dart';

class InfoVideoProvider with ChangeNotifier {
  List<Video> _videos = [];
  bool _isCarregando = false;

  List<Video> get videos => _videos;
  bool get isCarregando => _isCarregando;

  salvarVideo(String id, String categoria) async {
    try {
      final video = await buscarVideo(id, categoria);
      if (video != null) {
        _videos.add(video);
        notifyListeners();
      }
    } catch (e) {
      print('Erro ao salvar video');
    }
  }
}
