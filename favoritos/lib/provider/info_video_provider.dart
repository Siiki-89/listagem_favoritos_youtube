import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/model/video_model.dart';
import 'package:listagem_favoritos_youtube/service/video_service.dart';

class InfoVideoProvider with ChangeNotifier {
  final List<Video> _videos = [];
  List<Video> _videosFiltrados = [];
  bool _mostrandoBusca = false;

  List<Video> get videos => _mostrandoBusca ? _videosFiltrados : _videos;
  bool get mostrandoBusca => _mostrandoBusca;

  Future<void> salvarVideo(String id, String categoria) async {
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

  void iniciarBusca() {
    _mostrandoBusca = true;
    _videosFiltrados = _videos;
    notifyListeners();
  }

  void buscar(String texto) {
    _videosFiltrados =
        _videos
            .where((v) => v.titulo.toLowerCase().contains(texto.toLowerCase()))
            .toList();
    notifyListeners();
  }

  void cancelarBusca() {
    _mostrandoBusca = false;
    _videosFiltrados = [];
    notifyListeners();
  }
}
