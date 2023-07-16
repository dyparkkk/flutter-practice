import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Hey, Doyoung',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text('Welcome back'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
