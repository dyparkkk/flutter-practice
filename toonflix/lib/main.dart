import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'dart:io';

// user-agent 설정
// http 요청에서 사용자 디바이스, 소프트웨어 식별 정보 
// mozilla - os - 렌더링엔진 - 브라우저  
// 네이버에서 막아뒀기때문에 httpOverrides를 통해서 수정해서 우회
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
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
