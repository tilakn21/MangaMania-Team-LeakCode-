// Manga Model
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manga_mania/pages/main/manga_card.dart';

// Main Page
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Manga> mangas = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Manga Mania',
                  style: GoogleFonts.mPlus1p(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                // Handle manga action
              },
              icon: const Icon(Icons.menu_book),
            ),
            const Text(
              'Manga',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                // Handle favorite action
              },
              icon: const Icon(Icons.favorite_border),
            ),
            const Text(
              'Favorites',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Add the background image
          Positioned.fill(
            child: Image.asset(
              'lib/pages/home/images/bg.png',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.colorBurn,
            ),
          ),
          // Add the grid view
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 0.7,
            ),
            itemCount: mangas.length + 1, // Add 1 for the "Add" card
            itemBuilder: (context, index) {
              if (index == mangas.length) {
                return AddMangaCard(
                  onTap: () {
                    _showAddMangaDialog(context);
                  },
                );
              }
              return MangaCard(manga: mangas[index]);
            },
          ),
        ],
      ),
    );
  }

  void _showAddMangaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String imageUrl = '';
        bool isNSFW = false;

        return AlertDialog(
          title: Text('Add Manga'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(
                  hintText: 'Manga Title',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  imageUrl = value;
                },
                decoration: InputDecoration(
                  hintText: 'Image URL',
                ),
              ),
              SizedBox(height: 16.0),
              CheckboxListTile(
                title: Text('NSFW'),
                value: isNSFW ?? false,
                onChanged: (value) {
                  setState(() {
                    isNSFW = value ?? false;
                  });
                },
                activeColor:
                    Colors.black, // Set the color of the checkbox when checked
                checkColor: Colors.white, // Set the color of the checkmark
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      4.0), // Add rounded corners to the checkbox
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && imageUrl.isNotEmpty) {
                  final newManga = Manga(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: title,
                    imageUrl: imageUrl,
                    isNSFW: isNSFW,
                  );
                  setState(() {
                    mangas.add(newManga);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
