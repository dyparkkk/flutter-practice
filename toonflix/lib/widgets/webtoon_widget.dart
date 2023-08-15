import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class WebtoonList extends StatelessWidget {
  final String title, thumb, id;

  const WebtoonList({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector : 클릭 이벤트
      // 위젯으로 빼기 dart class
      // 다른 화면으로 보내기. 어떤 스크린 선택? ->
      // 모든 화면은 위젯. 화면전환 == 위젯바꿈
      // navigator는 위젯에 애니메이션추가해서 다른 화면으로 넘어온 느낌을 줌
      // route != statelessWidget
      // routebuilder?
      // scoffold 부터 시작. appbar 다시 생성
      onTap: () {
        Navigator.push(
          // 애니메이션 효과
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            // fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Hero(
            tag: id,
            child: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(3, 3),
                    )
                  ]),
              height: 300,
              child: Image.network(
                thumb,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title,
              style: const TextStyle(
                fontSize: 15,
              )),
        ],
      ),
    );
  }
}
