import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/contant.dart';
import 'package:random_number_generator/screen/Setting_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(onPressed: onPressedGenerateRandomNumbers),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedGenerateRandomNumbers() {
    setState(() {
      Set<int> numbers = {};
      while (numbers.length < 3) {
        int randomNumber = Random().nextInt(1000);
        numbers.add(randomNumber);
      }
      randomNumbers = numbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Random Number Generator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const SettingScreen();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.settings,
            color: redColor,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers
            .asMap()
            .entries
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(bottom: e.key == 2 ? 0 : 20.0),
                child: Row(
                  children: e.value
                      .toString()
                      .split('')
                      .map(
                        (e2) => Image.asset(
                          'asset/img/$e2.png',
                          height: 70.0,
                          width: 50.0,
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: const Text('Generate'),
      ),
    );
  }
}
