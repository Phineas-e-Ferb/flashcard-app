import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  late Dio dio;
  final String domain = dotenv.env["IP_ADDRESS"]!;

  Api() {
    dio = Dio();
  }

  String createUrl(String endpoint, String? args) {
    var url = "";

    args ??= "";

    url = domain + endpoint + args;
    return url;
  }

  Future<dynamic> getRequest(String endpoint, {String? args}) async {
    try {
      var response = await dio.get(createUrl(endpoint, args),
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      return {
        "error": "Status code not allowed",
        "message": "Something went wrong"
      };
    } on Exception catch (_) {
      return {
        "error": "Status code not allowed",
        "message": "Something went wrong"
      };
    }
    //Todo try catch
  }

  Future<dynamic> postRequest(String endpoint,
      {String? args, dynamic body}) async {
    try {
      var response = await dio.post(createUrl(endpoint, args), data: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      return {
        "error": "Status code not allowed",
        "message": "Something went wrong"
      };
    } on Exception catch (_) {
      return {
        "error": "Status code not allowed",
        "message": "Something went wrong"
      };
    }
    //Todo try catch
  }

  void updateRequest(String endpoint, {String? args, dynamic body}) async {
    await dio.put(createUrl(endpoint, args), data: body);
    //Todo try catch
  }
}
