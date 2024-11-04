import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_provider.g.dart';

final dio = Dio();

@riverpod
class Token extends _$Token {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _accessTokenKey = 'accessToken';

  @override
  Future<String?> build() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<void> login(String email, String password) async {
    final response =
        await dio.post('https://cms.pzkogrodek.cz/api/auth/local', data: {
      "identifier": email,
      "password": password,
    });

    final String? accessToken = response.data?['jwt'];
    if (accessToken != null) {
      await _storage.write(key: _accessTokenKey, value: accessToken);

      state = AsyncData(accessToken);
    } else {
      state = const AsyncData(null);
    }
  }

  Future<void> removeToken() async {
    await _storage.delete(key: _accessTokenKey);

    state = const AsyncData(null);
  }
}
