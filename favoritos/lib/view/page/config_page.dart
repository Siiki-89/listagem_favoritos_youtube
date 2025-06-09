import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações'),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Tema', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),)
        ],
      ),),
    );
  }
}
