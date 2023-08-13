import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  // key : 위젯 id, 빠른1 서치
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
