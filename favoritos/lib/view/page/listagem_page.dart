import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/provider/info_video_provider.dart';
import 'package:provider/provider.dart';

class ListagemPage extends StatelessWidget {
  const ListagemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos YT'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
            return GridView.builder(
              itemCount: provider.videos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                final videos = provider.videos[index];
                return GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      border: BorderDirectional(bottom: BorderSide(width: 2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(videos.imagem),
                        Text(
                          videos.titulo,
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        Text(
                          videos.categoria,
                          style: TextStyle(fontSize: 24, color: Colors.black),
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
