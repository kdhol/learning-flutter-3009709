import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (kDebugMode) {
            print('Pressed2');
          }
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Sign in',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
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
            )
          ],
        ),
      ),
    );
  }
}
