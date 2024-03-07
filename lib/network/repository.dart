import 'package:event_buddy/models/user_response_model.dart';
import 'package:event_buddy/network/dio_client.dart';
import 'package:event_buddy/utils/constants/endpoints.dart';

class Repository {
  final DioClient _network;
  Repository(this._network);

  Future<UserResponse> login(String username, password) async {
    final resp = await _network.post(
      Endpoints.login,
      {
        "username": username,
        "password": password,
      },
    );
    return UserResponse.fromJson(resp.data);
  }

  Future<UserResponse> register(Map<String, dynamic> data) async {
    final resp = await _network.post(Endpoints.register, data);
    return UserResponse.fromJson(resp.data);
  }
}
