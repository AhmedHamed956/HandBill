import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newidea.link/nauma-v1/public/api/',
      headers: {
        "Accept": "application/json",
      },
      validateStatus: (status) {
        return status < 500;
      },
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    ));
  }

  static Future<Response> getdata({
    @required String url,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbmV3aWRlYS5saW5rXC9uYXVtYS12MVwvcHVibGljXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjQ2MTYyMzIzLCJleHAiOjE3MDAxNjIzMjMsIm5iZiI6MTY0NjE2MjMyMywianRpIjoiWkx1YmxrRTdtYU01eWZKRSIsInN1YiI6NSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.KuUH-rgHBVs-gsFvyRJtYWSZjlikJClIFIwQh9PQlGQ',
      'Content-Type': 'application/json'
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postdata(
      {@required String url,
      Map<String, dynamic> query,
      @required Map<String, dynamic> data,
      String token}) async {
    print(token);
    dio.options.headers = {
      //'Authorization': token,

      'accept': 'application/json'
    };

    return dio.post(url, queryParameters: query ?? null, data: data);
  }
}
