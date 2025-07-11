import 'package:flutter/material.dart';

class GifWidget extends StatelessWidget {
  const GifWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/pages/home/images/manga-goku.gif',
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
    );
  }
}
