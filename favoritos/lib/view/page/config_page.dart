import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/model/cor_model.dart';
import 'package:listagem_favoritos_youtube/provider/cor_provider.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final corProvider = context.watch<CorProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tema',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Text('Cor da barra de tarefas'),
            DropdownButton<Cores>(
              hint: Text('Selecione a cor'),
              value: corProvider.corSelecionada,
              onChanged: corProvider.selecionar,
              items: corProvider.cores.map((Cores cor) {
                return DropdownMenuItem<Cores>(
                  value: cor,
                  child: Text(
                    cor.nome,
                    style: TextStyle(color: cor.cor),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
