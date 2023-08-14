import 'package:flutter/material.dart';
import 'package:toonflix/service/api_service.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

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
        // api 호출. state 변화
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ListView() / ListView.builder() 최적화
            // itemBuilder : context, index **
            // 메서드 분리.
            // column 추가. listview에 높이 제한 추가 -> expanded()
            return ListData(snapshot);
          }
          // 동그란 로딩중
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView ListData(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    // snapshot으로 부터 데이터를 가져와 보여줌
    // 보여주는 것은 home_screen의 역할. 데이터 처리는 ...? 따로 위젯으로 빼도 될듯 ! ->
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemBuilder: (context, index) {
        var webtoonModel = snapshot.data![index];
        // columnd에 image 추가
        // container로 크기 설정.
        //   decoration + clipBehavior (자식이 부모 침범 방지)
        return WebtoonList(
          title: webtoonModel.title,
          thumb: webtoonModel.thumb,
          id: webtoonModel.id,
        );
      },
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
    );
  }
}
