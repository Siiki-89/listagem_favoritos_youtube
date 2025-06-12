import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/provider/cor_provider.dart';
import 'package:listagem_favoritos_youtube/provider/info_video_provider.dart';
import 'package:provider/provider.dart';

class ListagemPage extends StatelessWidget {
  const ListagemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final videoProvider = context.watch<InfoVideoProvider>();
    final corProvider = context.watch<CorProvider>();

    return Scaffold(
      backgroundColor:
          corProvider.corSelecionadaBackground?.cor ?? Colors.white,
      appBar: AppBar(
        backgroundColor: corProvider.corSelecionadaTarefa?.cor ?? Colors.white,
        title:
            videoProvider.mostrandoBusca
                ? TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none,
                  ),
                  onChanged: videoProvider.buscar,
                )
                : Text(
                  'Favoritos YT',
                  style: TextStyle(color: Colors.blueGrey),
                ),
        actions: [
          IconButton(
            icon: Icon(
              videoProvider.mostrandoBusca ? Icons.close : Icons.search,
            ),
            onPressed: () {
              if (videoProvider.mostrandoBusca) {
                videoProvider.cancelarBusca();
              } else {
                videoProvider.iniciarBusca();
              }
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/config');
            },
            icon: Icon(Icons.construction_sharp),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/videoAdd');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<InfoVideoProvider>(
          builder: (context, provider, child) {
            final lista = provider.videos;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final video = lista[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          video.imagem,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          video.titulo,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          video.categoria,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
