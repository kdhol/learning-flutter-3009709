import 'package:flutter/material.dart';
import 'package:flutter_learn/login_page.dart';
import 'package:flutter_learn/utils/brand_color.dart';

import 'chat_page.dart';

void main() {
  runApp(const ChatApp());
}

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.teal, // Set primary color scheme
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);

final ThemeData myTheme2 = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: BrandColor.primaryColor, foregroundColor: Colors.white)
    // Set primary color scheme
    );

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My first App",
      theme: myTheme2,
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
