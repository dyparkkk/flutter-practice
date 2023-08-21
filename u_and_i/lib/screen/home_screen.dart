import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdcadd),
      body: SafeArea(
        // 안 가리게 해주는 위젯
        child: SizedBox(
          // MediaQuery.of(context) : 디바이스 화면 사이즈 가져오기
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPage(
                selectedDate: selectedDate,
                onPressed: onPressedHeartButton(),
              ),
              const _BottomPage(),
            ],
          ),
        ),
      ),
    );
  }

  VoidCallback onPressedHeartButton() {
    return () {
      showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          // 위젯이 화면 전체를 뒤덮는다면 위치를 알 수 없어서... align
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime dateTime) {
                  setState(
                    () {
                      selectedDate = dateTime;
                    },
                  );
                },
              ),
            ),
          );
        },
      );
    };
  }
}

class _TopPage extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  const _TopPage({
    required this.selectedDate,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  int diffDay(DateTime selectedDate) {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).difference(selectedDate).inDays;
  }

  // key -> super(key: key) 이거 뭐임??
  // data 상위 위젯에서 받기
  // setState() 함수도 매개변수로 받기
  // 데이터는 무조건 부모 -> 자식으로 흐름

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'U & I',
          style: themeText.displayLarge,
        ),
        Column(
          children: [
             Text(
              '우리 처음 만난날',
              style: themeText.bodyLarge,
            ),
            Text(
              DateFormat('yyyy.MM.dd').format(selectedDate),
              style: const TextStyle(
                fontFamily: 'NanumPen',
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: onPressed,
          iconSize: 60,
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        Text(
          'D'
          '${diffDay(selectedDate) >= 0 ? '+' : ''}'
          '${diffDay(selectedDate)}',
          style: const TextStyle(
            fontFamily: 'NanumPen',
            fontSize: 50,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _BottomPage extends StatelessWidget {
  const _BottomPage();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset('asset/img/love.jpg'),
    );
  }
}
