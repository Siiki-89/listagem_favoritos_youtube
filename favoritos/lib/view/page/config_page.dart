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
      backgroundColor:
          corProvider.corSelecionadaBackground?.cor ?? Colors.white,
      appBar: AppBar(
        backgroundColor: corProvider.corSelecionadaTarefa?.cor ?? Colors.black,
        title: Text('Configurações', style: TextStyle(color: Colors.blueGrey)),
        actions: [
          IconButton(
            onPressed: () async {
              await corProvider.salvarCores();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Cores salvas!')));
            },
            icon: Icon(Icons.add_task),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tema',
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Cor da barra de tarefas',
              style: TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
            DropdownButtonFormField<Cores>(
              dropdownColor: Colors.grey.shade200,
              icon: Icon(Icons.arrow_drop_down, color: Colors.blueGrey),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
              value: corProvider.corSelecionadaTarefa,
              onChanged: corProvider.selecionarCorTarefa,
              items:
                  corProvider.cores.map((Cores cor) {
                    return DropdownMenuItem<Cores>(
                      value: cor,
                      child: Text(
                        cor.nome,
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    );
                  }).toList(),
            ),
            Text(
              'Cor de fundo da aplicação',
              style: TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
            DropdownButtonFormField(
              dropdownColor: Colors.grey.shade200,
              icon: Icon(Icons.arrow_drop_down, color: Colors.blueGrey),
              value: corProvider.corSelecionadaBackground,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
              onChanged: corProvider.selecionarCorBackground,
              items:
                  corProvider.cores.map((Cores cor) {
                    return DropdownMenuItem<Cores>(
                      value: cor,
                      child: Text(
                        cor.nome,
                        style: TextStyle(color: Colors.blueGrey),
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
