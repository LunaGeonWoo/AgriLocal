import 'dart:convert';
import 'package:agrilocal/features/models/products.dart';
import 'package:agrilocal/features/models/products.detail.dart';
import 'package:agrilocal/features/models/users.dart';
import 'package:agrilocal/features/models/users.token.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

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
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
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

  Future<bool> postRefreshToken() async {
    final url = Uri.parse("$baseUrl/users/token/refresh/");
    String? refreshToken = await storage.read(key: 'refresh');
    if (refreshToken == null) return false;
    final response = await http.post(
      url,
      body: {
        'refresh': refreshToken,
      },
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      try {
        final token = TokenModel.fromJson(jsonData);
        await storage.write(key: 'access', value: token.access);
        return true;
      } catch (e) {
        throw Exception('Failed to refresh token');
      }
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  Future<bool> logout() async {
    await storage.delete(key: 'access');
    await storage.delete(key: 'refresh');
    return true;
  }

  Future<List<ProductTinyModel>> getProducts() async {
    List<ProductTinyModel> productInstances = [];
    final url = Uri.parse("$baseUrl/products/");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${await storage.read(key: 'access')}',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> products =
          jsonDecode(utf8.decode(response.bodyBytes));
      for (var product in products) {
        productInstances.add(ProductTinyModel.fromJson(product));
      }
      return productInstances;
    } else if (response.statusCode == 401) {
      await postRefreshToken();
      return await getProducts();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductDetailModel> getProductDetail(id) async {
    final url = Uri.parse("$baseUrl/products/$id/");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${await storage.read(key: 'access')}',
      },
    );
    if (response.statusCode == 200) {
      final product = jsonDecode(utf8.decode(response.bodyBytes));
      return ProductDetailModel.fromJson(product);
    } else if (response.statusCode == 401) {
      await postRefreshToken();
      return await getProductDetail(id);
    } else {
      throw Exception('Failed to load product detail');
    }
  }
}
