import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:listagem_favoritos_youtube/model/video_model.dart';
import 'package:network_info_plus/network_info_plus.dart';

Future<Video?> buscarVideo(String id, String categoria) async {
  final ipv4 = '192.168.1.10';
  final urlListar = 'http://$ipv4:8888/video/$id';
  Uri uri = Uri.parse(urlListar);
  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print('deu certo');
      final data = jsonDecode(response.body);
      return Video(
        categoria: categoria,
        imagem: data['imagem'],
        titulo: data['titulo'],
        canal: Canal(nome: data['canal']['nome'], url: data['canal']['url']),
      );
    } else {
      print('Erro');
      print(response.body);
      throw Exception('Erro ao carregar vídeos');
    }
  } catch (e) {
    print('Exception');
    print(e);
  }
  return null;
}
