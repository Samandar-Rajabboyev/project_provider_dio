import 'package:dio/dio.dart';

import '../model/post_model.dart';

class Network {
  static Dio dio = Dio(BaseOptions(
    baseUrl: "https://jsonplaceholder.typicode.com",
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
  ));

  /* Http Apis */

  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  /* Http Requests */

  static Future<dynamic> GET(String api, Map<String, String> params) async {
    var response = await dio.get(api);
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> POST(String api, Map<String, String> params) async {
    var response = await dio.post(api, data: params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> PUT(String api, Map<String, String> params) async {
    var response = await dio.put(api, data: params);
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> DEL(String api, Map<String, String> params) async {
    var response = await dio.delete(api);
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'title': post.title.toString(),
      'body': post.body.toString(),
      'userId': post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id.toString(),
      'title': post.title.toString(),
      'body': post.body.toString(),
      'userId': post.userId.toString(),
    });
    return params;
  }

  /* Http Parsing */

  static List<Post> parsePostList(List<dynamic> json) {
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}
