import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final String baseURL;

  ApiClient({required this.baseURL});

  final _client = http.Client();

  Future<http.Response> getHttp({
    required String endPoint,
    Map<String, dynamic>? params,
    bool token = false,
  }) async {
    final uri =
        Uri.parse('${baseURL}${endPoint}').replace(queryParameters: params);

    final response = await _client.get(
      uri,
      headers: await _getHeaders(token: token),
    );
    return response;
  }

  Future<http.Response> postHttp({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? params,
    bool token = false,
  }) async {
    final uri =
        Uri.parse('${baseURL}${endPoint}').replace(queryParameters: params);
    final response = await _client.post(
      uri,
      headers: await _getHeaders(token: token),
      body: json.encode(body),
    );
    return response;
  }

  Future<Map<String, String>> _getHeaders({bool token = false}) async {
    var header = {"content-type": "application/json"};
    // if (token) {
    //   UserController controller = Get.find();
    //   header['Authorization'] =
    //       'Token ${controller.user.value.data?.token ?? ""}';
    //   return header;
    // }

    return header;
  }
}
