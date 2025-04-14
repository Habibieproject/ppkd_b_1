import 'dart:convert';

import 'package:ppkd_b_1/model/login_model.dart';
import 'package:ppkd_b_1/service/auth_service.dart';

class AuthRepository {
  final AuthService _service = AuthService();

  Future<LoginResponse> login(String email, String password) async {
    final response = await _service.login(email, password);
    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(responseData);
    } else {
      return LoginResponse(message: responseData['message'], data: null);
    }
  }
}
