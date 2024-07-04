import 'dart:convert';
import 'package:agrilocal/features/models/users.dart';
import 'package:agrilocal/features/models/users.token.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final String baseUrl = 'http://192.168.1.208:8000/api/v1';

  static const storage = FlutterSecureStorage();

  Future<bool> postUsers({
    required username,
    required password,
    required name,
    required email,
    required address,
  }) async {
    final url = Uri.parse("$baseUrl/users/");
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
        'name': name,
        'email': email,
        'address': address,
      },
    );
    dynamic jsonData;
    if (response.statusCode == 200) {
      jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      try {
        UserModel.fromJson(jsonData);
      } catch (e) {
        throw Exception(e.toString());
      }
      return postToken(username: username, password: password);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<bool> checkId({
    required username,
  }) async {
    final url = Uri.parse("$baseUrl/users/username/$username/");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> postToken({
    required username,
    required password,
  }) async {
    final url = Uri.parse("$baseUrl/users/token/");
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      try {
        final token = TokenModel.fromJson(jsonData);
        await storage.write(key: 'access', value: token.access);
        await storage.write(key: 'refresh', value: token.refresh);
        return true;
      } catch (e) {
        throw Exception('Failed to load user');
      }
    } else {
      throw Exception('Failed to load user');
    }
  }
}
