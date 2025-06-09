import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/provider/info_video_provider.dart';
import 'package:provider/provider.dart';

class ListagemPage extends StatelessWidget {
  const ListagemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InfoVideoProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            provider.mostrandoBusca
                ? TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    border: InputBorder.none,
                  ),
                  onChanged: provider.buscar,
                )
                : Text('Favoritos YT'),
        actions: [
          IconButton(
            icon: Icon(provider.mostrandoBusca ? Icons.close : Icons.search),
            onPressed: () {
              if (provider.mostrandoBusca) {
                provider.cancelarBusca();
              } else {
                provider.iniciarBusca();
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
