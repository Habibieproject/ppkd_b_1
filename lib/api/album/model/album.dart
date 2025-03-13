// To parse this JSON data, do
//
//     final albumResponse = albumResponseFromJson(jsonString);

import 'dart:convert';

AlbumResponse albumResponseFromJson(String str) =>
    AlbumResponse.fromJson(json.decode(str));

String albumResponseToJson(AlbumResponse data) => json.encode(data.toJson());

class AlbumResponse {
  final int? userId;
  final int? id;
  final String? title;

  AlbumResponse({this.userId, this.id, this.title});

  factory AlbumResponse.fromJson(Map<String, dynamic> json) => AlbumResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {"userId": userId, "id": id, "title": title};
}
