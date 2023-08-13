import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;

  int totalTime = twentyFiveMinutes;
  late Timer timer;
  int pomodoros = 0;
  bool isRunning = false;

  void onTick(Timer timer) {
    if (totalTime == 0) {
      timer.cancel();
      setState(() {
        pomodoros = pomodoros + 1;
        totalTime = twentyFiveMinutes;
      });
    }
    setState(() {
      totalTime = totalTime - 1;
    });
  }

  // format(int seconds)
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var substring = duration.toString().split('.').first.substring(2);
    print(substring);
    return substring;
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalTime = twentyFiveMinutes;
    });
  }

  // 1초다 실행됨.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalTime),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline_rounded
                          : Icons.play_circle_outline_rounded,
                    ),
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                  ),
                  IconButton(
                    onPressed: onResetPressed,
                    icon: const Icon(Icons.restart_alt_rounded),
                    iconSize: 60,
                    color: Theme.of(context).cardColor,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'pomodoros',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color),
                          ),
                          Text(
                            '$pomodoros',
                            style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
