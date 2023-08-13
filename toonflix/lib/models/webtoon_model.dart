class WebtoonModel {
  final String id, title, thumb;
  // nameConstructor : asdasd
  //
  WebtoonModel.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumb = json['thumb'];
}
