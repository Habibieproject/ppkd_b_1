import 'dart:convert';

import 'package:ppkd_b_1/api/album/model/album.dart';
import 'package:http/http.dart' as http;
import 'package:ppkd_b_1/api/repo.dart';

Future<AlbumResponse> fetchAlbum() async {
  final response = await fetchAlbumAPI();
  print(response);
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
