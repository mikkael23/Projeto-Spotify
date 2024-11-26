import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> musicData = [
    {
      'title': 'Música 1',
      'image': 'https://igormiranda.com.br/wp-content/uploads/2021/09/Guns-N-Roses-Use-Your-Illusion-I.jpg', // URL de imagem fictícia
    },
    {
      'title': 'Música 2',
      'image': 'https://igormiranda.com.br/wp-content/uploads/2021/09/Guns-N-Roses-Use-Your-Illusion-I.jpg',
    },
    {
      'title': 'Música 3',
      'image': 'https://igormiranda.com.br/wp-content/uploads/2021/09/Guns-N-Roses-Use-Your-Illusion-I.jpg',
    },
    {
      'title': 'Música 4',
      'image': 'https://igormiranda.com.br/wp-content/uploads/2021/09/Guns-N-Roses-Use-Your-Illusion-I.jpg',
    },
    {
      'title': 'Música 5',
      'image': 'https://igormiranda.com.br/wp-content/uploads/2021/09/Guns-N-Roses-Use-Your-Illusion-I.jpg',
    },
    {
      'title': 'Música 6',
      'image': 'https://igormiranda.com.br/wp-content/uploads/2021/09/Guns-N-Roses-Use-Your-Illusion-I.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, // Início do gradiente
            end: Alignment.bottomRight, // Fim do gradiente
            colors: [const Color.fromARGB(255, 46, 46, 46), Colors.black], // Cores do gradiente (branco a preto)
          ),
        ),
        child: MusicGrid(musicData: musicData),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Boa Noite'),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            print('Notificações clicadas');
          },
        ),
        IconButton(
          icon: Icon(Icons.refresh, color: Colors.white),
          onPressed: () {
            print('Recarregando...');
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            print('Configurações clicadas');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class MusicGrid extends StatelessWidget {
  final List<Map<String, String>> musicData;

  MusicGrid({required this.musicData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        childAspectRatio: 3.5,
      ),
      itemCount: musicData.length,
      itemBuilder: (context, index) {
        final music = musicData[index];
        return MusicCard(music: music);
      },
    );
  }
}

class MusicCard extends StatelessWidget {
  final Map<String, String> music;

  MusicCard({required this.music});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 22, 228, 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)), // Arredondando todas as quinas do Card
      ),
      child: Container(
        height: 120, // Defina a altura do Card aqui
        child: Row(
          children: [
            Container(
              width: 80,  // Ajuste o valor de width da imagem
              height: 80,  // Ajuste a altura da imagem
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 2, 2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0), // Arredonda a quina superior esquerda
                  bottomLeft: Radius.circular(16.0), // Arredonda a quina inferior esquerda
                ),
              ),
              child: Image.network(
                music['image']!,
                width: 80,  // Ajuste o tamanho da imagem
                height: 80, // Ajuste a altura da imagem
                fit: BoxFit.cover,  // Garantir que a imagem cubra o espaço
              ),
            ),
            SizedBox(width: 12),  // Ajuste o espaço entre a imagem e o texto
            Expanded(
              child: Text(
                music['title']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,  // Ajuste o tamanho da fonte
                  fontWeight: FontWeight.bold,
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
