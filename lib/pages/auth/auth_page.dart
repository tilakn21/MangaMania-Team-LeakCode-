import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SignInPage(),
            ),
            Expanded(
              flex: 3,
              child: GifWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add form key

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey, // Associate the key with the form
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailController,
              style: const TextStyle(color: Colors.black), // Text color
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black), // Hint text color
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.black), // Default border color and width
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: Colors.black), // Stronger border when focused
                ),
              ),
              validator: (value) {
                // Validation logic here
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              style: const TextStyle(color: Colors.black), // Text color
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black), // Hint text color
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: Colors.black), // Default border color and width
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: Colors.black), // Stronger border when focused
                ),
              ),
              validator: (value) {
                // Validation logic here
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Button logic
              },
              child: const Text(
                'Sign In',
                style: TextStyle(color: Colors.white), // Text color on button
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigation logic
              },
              child: const Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: Colors.black), // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey, // Associate the key with the form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailController,
                style: const TextStyle(color: Colors.black), // Text color
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black), // Hint text color
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Colors.black), // Default border color and width
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: Colors.black), // Stronger border when focused
                  ),
                ),
                validator: (value) {
                  // Validation logic here
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                style: const TextStyle(color: Colors.black), // Text color
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black), // Hint text color
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: Colors.black), // Default border color and width
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: Colors.black), // Stronger border when focused
                  ),
                ),
                validator: (value) {
                  // Validation logic here
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Button logic
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white), // Text color on button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thank You'),
      ),
      body: const Center(
        child: Text(
          'Thank you for registration!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GifWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/pages/home/images/manga-goku.gif',
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
    );
  }
}
