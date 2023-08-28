import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/contant.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;

  const SettingScreen({
    required this.maxNumber,
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            children: [
              _Body(maxNumber: maxNumber),
              _Foot(
                maxNumber: maxNumber,
                onSliderChanged: onSliderChanged,
                onPressed: onGeneratePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }

  void onGeneratePressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: maxNumber
            .toInt()
            .toString()
            .split('')
            .map((e) =>
                Image.asset('asset/img/$e.png', height: 70.0, width: 50.0))
            .toList(),
      ),
    );
  }
}

class _Foot extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSliderChanged; // 뒤로가기해서 값이 없을 수도 있음.
  final VoidCallback onPressed;

  const _Foot({
    required this.maxNumber,
    required this.onSliderChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 1000000,
          onChanged: onSliderChanged,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: const Text('Generate'),
          ),
        )
      ],
    );
  }
}
