import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  bool showTitle = true;

  void onClick() {
    setState(() {
      counter++;
    });
  }

  void toggle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showTitle ? const LargeTitle() : const Text('nothing'),
            IconButton(
              onPressed: toggle,
              icon: const Icon(Icons.accessibility_sharp),
            ),
          ],
        )),
      ),
    );
  }
}

class LargeTitle extends StatefulWidget {
  const LargeTitle({
    super.key,
  });

  @override
  State<LargeTitle> createState() => _LargeTitleState();
}

class _LargeTitleState extends State<LargeTitle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Click Count',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
