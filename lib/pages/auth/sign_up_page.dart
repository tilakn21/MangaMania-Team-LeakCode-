import 'package:flutter/material.dart';
import 'package:manga_mania/pages/auth/login_page.dart';
import 'package:manga_mania/pages/auth/thank_you_page.dart';
import 'package:manga_mania/pages/auth/gif_widget.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey, // Associate the key with the form
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: nameController,
                              style: const TextStyle(
                                  color: Colors.black), // Text color
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: const TextStyle(
                                    color: Colors.black), // Hint text color
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: surnameController,
                              style: const TextStyle(
                                  color: Colors.black), // Text color
                              decoration: InputDecoration(
                                hintText: 'Surname',
                                hintStyle: const TextStyle(
                                    color: Colors.black), // Hint text color
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your surname';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        style:
                            const TextStyle(color: Colors.black), // Text color
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                              color: Colors.black), // Hint text color
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          }
                          if (!RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        style:
                            const TextStyle(color: Colors.black), // Text color
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              color: Colors.black), // Hint text color
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length != 8) {
                            return 'Password must be 8 characters long';
                          }
                          if (value.startsWith(RegExp(r'[!@#$%^&*()_+]'))) {
                            return 'Password cannot start with a special character';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: confirmPasswordController,
                        style:
                            const TextStyle(color: Colors.black), // Text color
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                              color: Colors.black), // Hint text color
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: dobController,
                        style:
                            const TextStyle(color: Colors.black), // Text color
                        decoration: InputDecoration(
                          hintText: 'Date of Birth',
                          hintStyle: const TextStyle(
                              color: Colors.black), // Hint text color
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.black),
                          ),
                        ),
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((value) {
                            if (value != null) {
                              dobController.text =
                                  '${value.day}/${value.month}/${value.year}';
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Validate the form
                            // Validation passed, navigate to ThankYouPage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ThankYouPage()),
                            );
                          } else {
                            // Validation failed, do nothing
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white), // Text color on button
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
