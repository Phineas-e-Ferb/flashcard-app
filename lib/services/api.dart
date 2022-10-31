import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const Map errorMapResponse = {
  "error": "Status code not allowed",
  "message": "Something went wrong"
};

class Api extends ChangeNotifier {
  late Dio dio;
  final domain = dotenv.env["IP_ADDRESS"]!;

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
      if (response.statusMessage == "Ok") {
        return response.data;
      } else {
        throw errorMapResponse;
      }
    } on Exception catch (_) {
      throw errorMapResponse;
    }
  }

  Future<dynamic> postRequest(String endpoint,
      {String? args, dynamic body}) async {
    try {
      var response = await dio.post(createUrl(endpoint, args), data: body);
      if (response.statusMessage == "Ok") {
        return response.data;
      } else {
        throw errorMapResponse;
      }
    } on Exception catch (_) {
      throw errorMapResponse;
    }
  }
}
