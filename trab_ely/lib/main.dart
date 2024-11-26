import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI do Spotify',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  // Controlador para selecionar a navegação
  int _indiceSelecionado = 0;

  // Função para mudar o índice da barra de navegação
  void _aoSelecionarItem(int indice) {
    setState(() {
      _indiceSelecionado = indice;
    });
  }

  final List<Map<String, String>> dadosMusicais = [
    {
      'titulo': 'Arnaldo Antunes',
      'imagem':
          'https://imgsapp2.correiobraziliense.com.br/app/noticia_127983242361/2020/02/26/830430/20200225180236296517a.jpg',
    },
    {
      'titulo': 'Ao Vivo No Estudio',
      'imagem':
          'https://i.scdn.co/image/ab67616d0000b2736a201d985818d65d06d2da25',
    },
    {
      'titulo': 'Tuyo',
      'imagem':
          'https://yt3.googleusercontent.com/NMYSpbsvpWnRs9RRzzjMqGn7hF3oSX-KJDtqDLxcN6uLDx5etA0h_qFPCN0F22kaUKTNCx1DPQ=s900-c-k-c0x00ffffff-no-rj',
    },
    {
      'titulo': 'As 50 Mais Tocadas No Br',
      'imagem':
          'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da84425742d5e177fe7aa5fe5d33',
    },
    {
      'titulo': 'Famous',
      'imagem':
          'https://i0.wp.com/dictionaryblog.cambridge.org/wp-content/uploads/2024/02/fame.jpg?ssl=1',
    },
    {
      'titulo': 'Drama',
      'imagem':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-t6C4XK73ge-xNS1cQE-RuSm_PbM5-4NjWQ&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCustomizada(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradeDeMusicas(dadosMusicais: dadosMusicais),
            // Seção "Playlists Populares"
            cabecalho(titulo: 'Playlists Populares'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 500,
                    height: 300,
                    margin: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 16,
                          left: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              'https://a-static.mlcdn.com.br/800x560/cd-metalica-master-of-puppets-universal/estacaocd/042283814127/3840f12cf1459811fa4d8bce192c1a9d.jpg',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 67,
                          left: 110,
                          child: Text(
                            'METALICA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          left: 180,
                          right: 112,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 42, 42, 42),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Título da Playlist Popular',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Esta é a descrição da playlist popular, explicando o tipo de música que você encontrará aqui.',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 14,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Seção "Feito Para Você"
            cabecalho(titulo: 'Feito Para Você'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CartaoPlaylist(
                    titulo: 'Repetir',
                    subtitulo:
                        'As músicas que você não consegue parar de ouvir agora.',
                    imagem:
                        'https://igormiranda.com.br/wp-content/uploads/2021/09/Guns-N-Roses-Use-Your-Illusion-I.jpg',
                  ),
                  CartaoPlaylist(
                    titulo: 'Seu Descobrimento Semanal',
                    subtitulo: 'Sua mixtape semanal de músicas novas.',
                    imagem:
                        'https://igormiranda.com.br/wp-content/uploads/2021/09/Guns-N-Roses-Use-Your-Illusion-I.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Rodapé com BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _indiceSelecionado,
        onTap: _aoSelecionarItem,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}

class AppBarCustomizada extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bom Dia',
            style: TextStyle(
              color: const Color.fromARGB(143, 180, 180, 180),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Ação para o botão de configurações
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class GradeDeMusicas extends StatelessWidget {
  final List<Map<String, String>> dadosMusicais;

  GradeDeMusicas({required this.dadosMusicais});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 3.5,
      ),
      itemCount: dadosMusicais.length,
      itemBuilder: (context, index) {
        final musica = dadosMusicais[index];
        return CartaoMusica(musica: musica);
      },
    );
  }
}

class CartaoMusica extends StatelessWidget {
  final Map<String, String> musica;

  CartaoMusica({required this.musica});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(musica['imagem']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                musica['titulo']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cabecalho extends StatelessWidget {
  final String titulo;

  cabecalho({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CartaoPlaylist extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String imagem;

  CartaoPlaylist(
      {required this.titulo, required this.subtitulo, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: 250,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  imagem,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 160,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  titulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  subtitulo,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
