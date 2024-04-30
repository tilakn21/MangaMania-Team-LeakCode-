// Manga Model
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:manga_mania/pages/main/chatbot.dart';
import 'package:manga_mania/pages/main/manga_card.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;

  PdfViewerPage({required this.pdfUrl});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  @override
  Widget build(BuildContext context) {
    // Remove the entire PdfViewerPage class and its contents
    // This class is no longer needed since we're not using the PDF viewer
    return Container(); // Return an empty container
  }
}

// Main Page
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Manga> mangas = [
    Manga(
      id: '1',
      title: 'Naruto',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg',
      isNSFW: false,
      pdfUrl: "lib/pdfs/testpdf_1.pdf",
      externalLink: "https://mangaplus.shueisha.co.jp/viewer/1000397",
    ),
    Manga(
      id: '2',
      title: 'One Piece',
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BM2YwYTkwNjItNGQzNy00MWE1LWE1M2ItOTMzOGI1OWQyYjA0XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_FMjpg_UX1000_.jpg',
      isNSFW: false,
      pdfUrl: "lib/pdfs/testpdf_2.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1000486',
    ),
    Manga(
      id: '3',
      title: 'Attack On Titan',
      imageUrl:
          'https://m.media-amazon.com/images/I/71S8O-3xLVL._AC_UF1000,1000_QL80_.jpg',
      isNSFW: true,
      pdfUrl: "lib/pdfs/testpdf_3.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1000935',
    ),
    Manga(
      id: '4',
      title: 'Shonen Jump',
      imageUrl:
          'https://m.media-amazon.com/images/I/81X5Wy1uMUL._AC_UF1000,1000_QL80_.jpg',
      isNSFW: true ,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink:
          'https://mangaplus.shueisha.co.jp/viewer/1021094',
    ),
    Manga(
      id: '5',
      title: 'Vagabond',
      imageUrl:
          'https://imgs.search.brave.com/qYXTgvoFwAeyXb_xArAMmxOc31fMlXIrto0boUtuDy0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzUxUzZqUkRzbjhM/LmpwZw',
      isNSFW: false,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1020488',
    ),
    Manga(
      id: '6',
      title: 'Fullmetal Alchemy',
      imageUrl:
          'https://m.media-amazon.com/images/I/61GWN9NPJvL._AC_UF1000,1000_QL80_.jpg',
      isNSFW: true,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1016716',
    ),
    Manga(
      id: '7',
      title: 'Chainsaw Man',
      imageUrl:
          'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781974709939/chainsaw-man-vol-1-9781974709939_hr.jpg',
      isNSFW: true,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1001249',
    ),
    Manga(
      id: '8',
      title: 'Super Psychic Policeman Chojo',
      imageUrl:
          'https://imgs.search.brave.com/tJRiTuOCBYJt59aNXmj8yr9jr0aL5lNz4Pzk5Of9usA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/c3VwZXItcHN5Y2hp/Yy1wb2xpY2VtYW4t/Y2hvam8tbWFuZ2Fw/bHVzLXByZXZpZXct/aW1hZ2UtdjAtZGR2/ZnFqNjR4emhjMS5q/cGVnP2F1dG89d2Vi/cCZzPTI4MzUzMDc2/ZDEzOWY5MzI2MTRj/YjkwZjg0OWI1NDE1/OTgyNDA1ZGM',
      isNSFW: false,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1020167',
    ),
    Manga(
      id: '9',
      title: 'Jujutsu Kaisen',
      imageUrl:
          'https://imgs.search.brave.com/Z-jJvl26eT4zSOvObFpzHsWBw92qAfZcau6hlC-uRFM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMxLnNyY2RuLmNv/bS93b3JkcHJlc3Mv/d3AtY29udGVudC91/cGxvYWRzLzIwMjMv/MDkvanVqdXRzdS1r/YWlzZW4tYW5pbWUt/cG9zdGVyLmpwZw',
      isNSFW: true,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1001279',
    ),  
    Manga(
      id: '10',
      title: 'My Hero Academia',
      imageUrl:
          'https://imgs.search.brave.com/XjNO5WJ0ScfKOuhZDlFidNUpFTAYogbDeoQXa7uYalc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL00v/TVY1QllqVmlPV1kz/WVRRdE5UbGlPQzAw/Tnprd0xUbGxNR010/TWpOaVpUVTBNbVpq/WlRnelhrRXlYa0Zx/Y0dkZVFYVnlPRGd6/TlRRMU5UVUAuanBn',
      isNSFW: false,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1000390',
    ),
    Manga(
      id: '11',
      title: 'Kagurabachi',
      imageUrl:
          'https://imgs.search.brave.com/AU242LM-N0i_P_Qk5D3lgNxcwLdxW1OroAs2pXR1d9I/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvZW4vdGh1bWIv/ZC9kYS9LYWd1cmFi/YWNoaV9Wb2x1bWVf/MV9Db3Zlci5qcGcv/NTEycHgtS2FndXJh/YmFjaGlfVm9sdW1l/XzFfQ292ZXIuanBn',
      isNSFW: false,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1018870',
    ),
    Manga(
      id: '12',
      title: 'Kyokuto Necromance',
      imageUrl:
          'https://imgs.search.brave.com/2eIrrh1pKUqcZuO7uVByZr-Cn4iSXt0EVmFo3xen7zw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/a3lva3V0by1uZWNy/b21hbmNlLWJ5LWZ1/c2FpLW5hYmEtam9p/bnMtdGhlLXNob25l/bi1qdW1wLXYwLWJo/azdvbG5nMWJ2YzEu/anBlZz93aWR0aD02/NDAmY3JvcD1zbWFy/dCZhdXRvPXdlYnAm/cz1hZWU4OGFhMjlm/NWE2ZGM2ODY1MDU5/ODlkYTI1NjFlMjYw/M2UzNTM3',
      isNSFW: false,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1021096',
    ),
    Manga(
      id: '13',
      title: 'Tokyo Underworld',
      imageUrl:
          'https://imgs.search.brave.com/Za91q8HF8T13gNRDrGxmuBj4oftqHvrpFEyuJRjZWcQ/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/YXJ0LXRva3lvLXVu/ZGVyd29ybGQtdm9s/dW1lLTEtdjAtbXZ1/a2N6N2FrNDFhMS5q/cGc_YXV0bz13ZWJw/JnM9NGNmZDY2NTg1/NDExYmFkYzc3ZWMx/ZTA5ODI3ZGFmZWU0/MjdiZGExYw',
      isNSFW: true,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1014587',
    ),
    Manga(
      id: '14',
      title: '2.5 Dimensional Seduction',
      imageUrl:
          'https://imgs.search.brave.com/7VIRzHYbF1ur1gGvmT0lmDQ31IltxxRzVsGlQ698KBk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8yNWRp/bWVuc2lvbmFsc2Vk/dWN0aW9uLm9ubGlu/ZS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/NC8wMi8yLjUtRGlt/ZW5zaW9uYWwtU2Vk/dWN0aW9uLU1hbmdh/LndlYnA',
      isNSFW: true,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1019345',
    ),
    Manga(
      id: '15',
      title: 'Dogsred',
      imageUrl:
          'https://imgs.search.brave.com/ZW8EJzrmdSX1fK4-ZlRyiLgg_MgITZFX8XB35PIO6h8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvZW4vdGh1bWIv/NC80NC9TdXBpbmFt/YXJhZGEuanBnLzUx/MnB4LVN1cGluYW1h/cmFkYS5qcGc',
      isNSFW: false,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1019491',
    ),
    Manga(
      id: '16',
      title: '【OSHI NO KO】',
      imageUrl:
          'https://imgs.search.brave.com/A84cgTXjEb8uJoMbO_L36A7jwQ1FQNMjcb4yzSb6AMI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDEwMDE5/NDA2LmpwZw',
      isNSFW: true,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1013146',
    ),
    Manga(
      id: '17',
      title: 'Romantic Killer',
      imageUrl:
          'https://imgs.search.brave.com/tsMbsWB1ZdMe3onFHLXmsvoDCmv0JP5jYWg_bKCuT88/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzgxNDZ3SktjK3lM/LmpwZw',
      isNSFW: true,
      pdfUrl: "lib/pdfs/testpdf_4.pdf",
      externalLink: 'https://mangaplus.shueisha.co.jp/viewer/1015146',
    ),
  ];

  Future<void> _openExternalLink(String externalLink) async {
    if (await canLaunchUrl(Uri.parse(externalLink))) {
      await launchUrl(Uri.parse(externalLink));
      print('launched');
    } else {
      // Handle the case where the external link cannot be launched
      // You can display an error message or take other appropriate actions
      print('Could not launch $externalLink');
    }
  }

  void openCustomLink(String customLink) async {
    if (await canLaunchUrl(Uri.parse(customLink))) {
      await launchUrl(Uri.parse(customLink));
    } else {
      throw 'Could not launch $customLink';
    }
  }

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
                Navigator.pushNamed(context, '/manga');
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
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
            const Text(
              'Liked',
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 0.7,
            ),
            itemCount: mangas.length + 1, // Add 1 for the "Add" card
            itemBuilder: (context, index) {
              if (index == mangas.length) {
                // Render the "Add" card
                return Card(
                  child: InkWell(
                    onTap: () {
                      _showAddMangaDialog(context);
                      //openCustomLink(
                      //  "https://www.youtube.com/watch?v=4sCa4ekLB5Q");
                    },
                    child: const Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                );
              } else {
                // Render the manga cards
                return MangaCard(manga: mangas[index]);
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          void openCustomLink(String customLink) async {
            if (await canLaunchUrl(Uri.parse(customLink))) {
              await launchUrl(Uri.parse(customLink));
            } else {
              throw 'Could not launch $customLink';
            }
          }

          openCustomLink(
              "https://www.anime-planet.com/forum/threads/one-piece.17625/");
        },
        tooltip: 'Forums',
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.forum,
              color: Colors.black,
            ), // Discussion icon
            Text(
              'Forums',
              style: TextStyle(color: Colors.black),
            ), // Text "Forums"
          ],
        ),
      ),
    );
  }

  void _showAddMangaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String imageUrl = '';
        String pdfUrl = '';
        bool isNSFW = false;

        return AlertDialog(
          title: const Text('Add Manga'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Manga Title',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  imageUrl = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Image URL',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  pdfUrl = value;
                },
                decoration: const InputDecoration(
                  hintText: 'PDF URL',
                ),
              ),
              const SizedBox(height: 16.0),
              // CheckboxListTile(
              //   title: Text('NSFW'),
              //   value: isNSFW ?? false,
              //   onChanged: (value) {
              //     setState(() {
              //       isNSFW = value ?? false;
              //     });
              //   },
              //   activeColor: Colors.black,
              //   checkColor: Colors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(4.0),
              //   ),
              // ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty &&
                    imageUrl.isNotEmpty &&
                    pdfUrl.isNotEmpty) {
                  final newManga = Manga(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: title,
                    imageUrl: imageUrl,
                    pdfUrl: pdfUrl,
                    isNSFW: isNSFW,
                    externalLink: '',
                  );
                  setState(() {
                    mangas.add(newManga);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
