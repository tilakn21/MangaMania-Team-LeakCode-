import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_mania/pages/auth/auth_page.dart';
import 'package:manga_mania/pages/home/home_page.dart';

final navigationProvider = ChangeNotifierProvider((ref) => NavigationState());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manga Mania',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/thankyou': (context) => const ThankYouPage(),
      },
    );
  }
}

class NavigationState extends ChangeNotifier {
  String _currentPage = '/';

  String get currentPage => _currentPage;

  void navigateTo(String route) {
    _currentPage = route;
    notifyListeners();
  }
}
