import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manga_mania/pages/main/main_page.dart';
import 'package:pdfrx/pdfrx.dart';

class Manga {
  final String id;
  final String title;
  final String imageUrl;
  final String pdfUrl;
  final bool isNSFW;

  Manga({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.pdfUrl,
    required this.isNSFW,
  });
}

class MangaCard extends StatelessWidget {
  final Manga manga;

  MangaCard({required this.manga});

  void _openPdf(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(pdfUrl: manga.pdfUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _openPdf(context);
        },
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      manga.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  if (manga.isNSFW)
                    Center(
                      child: Text(
                        'NSFW',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
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
