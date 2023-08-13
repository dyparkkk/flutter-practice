import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

// static !!
class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  // Futrue<X> : 미래에 값을 받는것. 미래에 받을값 X
  // 비동기처리됨. 결과 확인 안하고 넘어감
  // await : 동기로 바꿈. 기다림 async에서만 사용가능

  static Future<List<WebtoonModel>> getToday() async {
    List<WebtoonModel> webtoons = [];
    final uri = Uri.parse('$baseUrl/$today');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      //jsonDecode
      // dynamic 반환 : 모든 타입 가능
      // 타입 지정 필요
      List<dynamic> bodys = jsonDecode(response.body);
      for (var body in bodys) {
        // 흔하게 사용하는 파싱 패턴
        webtoons.add(WebtoonModel.fromjson(body));
      }
      return webtoons;
    }
    throw Error();
  }
}
