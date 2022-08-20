 import 'dart:ffi';

class PostModel {
   PostModel({
    required this.userId,
    required this.id,
    required this.title,});

   PostModel.fromJson(dynamic json) {
    userId = json['userId'] ;
    id = json['id'] ;
    title = json['title'] ;
  }
  late int userId;
  late int id;
  late String title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }

}
