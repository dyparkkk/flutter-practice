import 'package:flutter/material.dart';
import 'package:toonflix/service/api_service.dart';
import 'package:toonflix/models/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getToday();

  // initState() : 위젯이 생성될때 호출
  // 상태 저장. is로딩, 데이터list
  // 비동기함수 waitForWebToons()
  // setState() : 사용 자제하기 !! 실수 여지, 중복

  //futureBuilder : UI 빌드. future타입 전달.
  // builder : context, snapshot(future의 상태 표시). 이걸 내가 만들 필요 없음
  // 자동 await. 결과에 따라서 코딩하면됨.
  // future정의만 하면 됨.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          'Today',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ListView() / ListView.builder() 최적화
            // itemBuilder : context, index **
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var webtoonModel = snapshot.data![index];
                return Text(webtoonModel.title);
              },
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
            );
          }
          // 동그란 로딩중
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
