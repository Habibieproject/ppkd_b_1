import 'package:http/http.dart' as http;
import 'package:ppkd_b_1/api/endpoint.dart';

Future<http.Response> fetchAlbumAPI() {
  print('${Endpoint.baseUrl}/albums/1');
  return http.get(Uri.parse('${Endpoint.baseUrl}/albums/1'));
}
