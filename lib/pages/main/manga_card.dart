import 'package:flutter/material.dart';

class Manga {
  final String id;
  final String title;
  final String imageUrl;
  final bool isNSFW;

  Manga(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.isNSFW});
}

// Manga Card
class MangaCard extends StatelessWidget {
  final Manga manga;

  MangaCard({required this.manga});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                manga.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  manga.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (manga.isNSFW)
                  const Text(
                    'NSFW',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddMangaCard extends StatelessWidget {
  final VoidCallback onTap;

  AddMangaCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: const Center(
          child: Icon(Icons.add, size: 48),
        ),
      ),
    );
  }
}
