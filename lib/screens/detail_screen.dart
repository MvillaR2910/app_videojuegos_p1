import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> game;

  const DetailScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> platforms = game['platforms'] ?? [];
    final List<dynamic> genres = game['genres'] ?? [];
    final List<dynamic> tags = game['tags'] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(game['name'], style: const TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color(0xFF494949),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(game['background_image']),
            const SizedBox(height: 16),
            Text(
              game['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Puntuación:',
              style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
            ),
            Text(
              '${game['rating']}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            if (game['metacritic'] != null) ...[
              const Text(
                'Metacritic:',
                style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
              ),
              Text(
                '${game['metacritic']}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
            ],
            const Text(
              'Fecha de lanzamiento:',
              style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
            ),
            Text(
              game['released'] ?? 'No disponible',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Género(s):',
              style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
            ),
            Text(
              genres.map((g) => g['name']).join(', '),
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Plataformas:',
              style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
            ),
            Text(
              platforms.map((p) => p['platform']['name']).join(', '),
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tags:',
              style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
            ),
            Wrap(
              children:
                  tags.take(6).map((tag) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8, bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
