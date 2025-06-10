import 'package:flutter/material.dart';
import 'package:listagem_favoritos_youtube/provider/cor_provider.dart';
import 'package:listagem_favoritos_youtube/provider/info_video_provider.dart';
import 'package:listagem_favoritos_youtube/view/page/add_video_page.dart';
import 'package:listagem_favoritos_youtube/view/page/config_page.dart';
import 'package:listagem_favoritos_youtube/view/page/listagem_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InfoVideoProvider()),
        ChangeNotifierProvider(create: (_) => CorProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListagemPage(),
      theme: ThemeData.dark(),
      initialRoute: '/listagem',
      routes: {
        '/listagem': (_) => ListagemPage(),
        '/videoAdd': (_) => AddVideoPage(),
        '/config': (_) => ConfigPage(),
      },
    );
  }
}
