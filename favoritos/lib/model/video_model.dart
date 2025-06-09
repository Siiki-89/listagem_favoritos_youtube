class Canal {
  final String nome;
  final String url;

  Canal({required this.nome, required this.url});

  factory Canal.fromJson(Map<String, dynamic> json) {
    return Canal(nome: json['nome'], url: json['url']);
  }
}

class Video {
  final String imagem;
  final String titulo;
  final Canal canal;
  final String categoria;

  Video({
    required this.categoria,
    required this.imagem,
    required this.titulo,
    required this.canal,
  });

  factory Video.fromJson(Map<String, dynamic> json, String categoria) {
    return Video(
      imagem: json['imagem'],
      titulo: json['título'],
      canal: Canal.fromJson(json['canal']),
      categoria: categoria,
    );
  }
}
