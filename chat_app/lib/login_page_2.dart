import 'package:flutter/material.dart';

class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              'Sign in',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              textAlign: TextAlign.center,
              'You missed\nsince 2 weeks!',
              style: TextStyle(
                fontSize: 24.0, // Use a more moderate font size
                color: Colors.blueAccent, // Or any color from your theme
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              'https://shorturl.at/4Sp96',
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Please Login',
                  style: TextStyle(fontSize: 40),
                )),
            OutlinedButton(onPressed: () {}, child: const Text('K')),
            TextButton(onPressed: () {}, child: const Text('K')),
          ],
        ),
      ),
    );
  }
}
