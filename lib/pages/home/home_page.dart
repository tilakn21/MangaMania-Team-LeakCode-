import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
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
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Manga Mania',
                  style: GoogleFonts.mPlus1p(
                    fontSize: 30, // Increased font size
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
                fontSize: 24, // Increased font size
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
                fontSize: 24, // Increased font size
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/pages/home/images/guts-manga.gif',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to Manga Mania!',
                          style: GoogleFonts.mPlus1p(
                            fontSize: 72, // Increased font size
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 32), // Increased gap
                        Text(
                          'Read and discover the best manga!',
                          style: GoogleFonts.mPlus1p(
                            fontSize: 48, // Increased font size
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 5),
                    Column(
                      children: [
                        Text(
                          "Don't have an account yet?",
                          style: GoogleFonts.mPlus1p(
                            fontSize: 24, // Increased font size
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 200, // Increased button width
                          height: 60, // Increased button height
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              // Add button action here
                            },
                            label: const Text('Sign Up',
                                style: TextStyle(
                                  fontSize: 32, // Increased font size
                                  color: Colors.black,
                                )),
                            backgroundColor: Colors.white.withOpacity(0.85),
                          ),
                        ),
                        const SizedBox(height: 16), // Increased gap
                        Text(
                          "Already registered?",
                          style: GoogleFonts.mPlus1p(
                            fontSize: 24, // Increased font size
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 200, // Increased button width
                          height: 60, // Increased button height
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              // Add button action here
                            },
                            label: const Text('Sign in',
                                style: TextStyle(
                                  fontSize: 32, // Increased font size
                                  color: Colors.black,
                                )),
                            backgroundColor: Colors.white.withOpacity(0.85),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
