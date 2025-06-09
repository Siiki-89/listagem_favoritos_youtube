import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/provider/info_video_provider.dart';
import 'package:provider/provider.dart';

class AddVideoPage extends StatelessWidget {
  const AddVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController urlController = TextEditingController();
    TextEditingController categoriaController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('Cadastro'),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<InfoVideoProvider>().salvarVideo(
                urlController.text,
                categoriaController.text,
              );
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
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            TextFormField(controller: urlController),
            Text(
              'Categorias (#)',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            TextFormField(controller: categoriaController),
          ],
        ),
      ),
    );
  }
}
