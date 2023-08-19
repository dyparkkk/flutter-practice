import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

//  homeScreen 실행될때, 위젯 사라질때 각각 실행.
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      var currentPage = controller.page!.toInt();
      int nextPage = (currentPage + 1) % 4;

      controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.bounceIn,
      );
    });
  }

  @override
  void dispose() {
    // controller와 timer는 dispose() 필수
    controller.dispose();
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(
        controller: controller,
        // page 자동 스크롤
        children: [1, 2, 3, 4, 5]
            .map((e) =>
                Image.asset('asset/img/image_0$e.jpg', fit: BoxFit.cover))
            .toList(),
      ),
    );
  }
}
