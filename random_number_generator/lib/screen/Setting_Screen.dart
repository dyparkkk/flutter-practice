import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/contant.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double number = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: number
                      .toInt()
                      .toString()
                      .split('')
                      .map((e) => Image.asset('asset/img/$e.png',
                          height: 70.0, width: 50.0))
                      .toList(),
                ),
              ),
              Slider(
                value: number,
                min: 10000,
                max: 1000000,
                onChanged: (double value) {
                  setState(() {
                    number = value;
                  });
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Generate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
