import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/model/cor_model.dart';
import 'package:listagem_favoritos_youtube/view/page/config_page.dart';
import 'package:provider/provider.dart';

class CorProvider with ChangeNotifier {
  List<Cores> _cores = [
    Cores(nome: 'Azul', cor: Colors.blue),
    Cores(nome: 'Verde', cor: Colors.green),
    Cores(nome: "Preto", cor: Colors.black),
    Cores(nome: 'Vermelho', cor: Colors.red),
  ];
  Cores? _corSelecionada;

  List<Cores> get cores => _cores;
  Cores? get corSelecionada => _corSelecionada;

  void selecionar (Cores? cor){
    _corSelecionada = cor;
    notifyListeners();
  }
}
