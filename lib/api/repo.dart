import 'package:http/http.dart';
import 'package:ppkd_b_1/api/endpoint.dart';

Future<Response> fetchAlbumAPI() {
  // print('${Endpoint.baseUrl}/albums/1');
  Future<Response> responseApi = get(
    Uri.parse('${Endpoint.baseUrl}/albums?id=1'),
  );
  return responseApi;
}
