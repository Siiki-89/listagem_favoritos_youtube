import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/provider/cor_provider.dart';
import 'package:listagem_favoritos_youtube/provider/info_video_provider.dart';
import 'package:provider/provider.dart';

class AddVideoPage extends StatelessWidget {
  const AddVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final corProvider = context.watch<CorProvider>();
    final videoProvider = context.read<InfoVideoProvider>();
    TextEditingController urlController = TextEditingController();
    TextEditingController categoriaController = TextEditingController();

    return Scaffold(
      backgroundColor:
          corProvider.corSelecionadaBackground?.cor ?? Colors.white,

      appBar: AppBar(
        title: Text('Cadastro', style: TextStyle(color: Colors.blueGrey)),
        backgroundColor: corProvider.corSelecionadaTarefa?.cor ?? Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              final url = urlController.text;
              final categoria = categoriaController.text;
              try {
                await videoProvider.salvarVideo(url, categoria);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Vídeo salvo com sucesso!')),
                );
                Navigator.pop(context);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao salvar vídeo!')),
                );
              }
            },
            icon: Icon(Icons.add_task),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'URL do video',
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
            TextFormField(
              controller: urlController,
              style: TextStyle(color: Colors.blueGrey),
            ),
            Text(
              'Categorias (#)',
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
            TextFormField(
              controller: categoriaController,
              style: TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
