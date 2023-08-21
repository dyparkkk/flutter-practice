import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NanumPen',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: 90,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
    ),
  );
}
