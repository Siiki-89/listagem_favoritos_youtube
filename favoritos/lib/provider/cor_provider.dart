import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/model/cor_model.dart';
import 'package:listagem_favoritos_youtube/view/page/config_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CorProvider with ChangeNotifier {
  List<Cores> _cores = [
    Cores(nome: 'Azul', cor: Colors.blue),
    Cores(nome: 'Verde', cor: Colors.green),
    Cores(nome: "Roxo", cor: Colors.purple),
    Cores(nome: 'Vermelho', cor: Colors.red),
    Cores(nome: 'Branco', cor: Colors.white),
    Cores(nome: 'Preto', cor: Colors.black),
  ];
  Cores? _corSelecionadaTarefa;
  Cores? _corSelecionadaBackground;

  List<Cores> get cores => _cores;
  Cores? get corSelecionadaTarefa => _corSelecionadaTarefa;
  Cores? get corSelecionadaBackground => _corSelecionadaBackground;

  void selecionarCorTarefa(Cores? cor) {
    _corSelecionadaTarefa = cor;
    notifyListeners();
  }

  void selecionarCorBackground(Cores? cor) {
    _corSelecionadaBackground = cor;
    notifyListeners();
  }

  Future<void> salvarCores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('backgroundColor', _corSelecionadaBackground!.cor.value);
    await prefs.setInt('tarefaColor', _corSelecionadaTarefa!.cor.value);
  }

  Future<void> carregarCores() async {
    final prefs = await SharedPreferences.getInstance();
    final backgroundColor = prefs.getInt('backgroundColor');
    final tarefaColor = prefs.getInt('tarefaColor');

    if (backgroundColor != null) {
      _corSelecionadaBackground = _cores.firstWhere(
        (c) => c.cor.value == backgroundColor,
      );
    }

    if (tarefaColor != null) {
      _corSelecionadaTarefa = _cores.firstWhere(
        (c) => c.cor.value == tarefaColor,
      );
    }

    notifyListeners();
  }
}
