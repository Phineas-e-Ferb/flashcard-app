import 'package:dio/dio.dart';

class FlashCardService {
  late Dio dio;
  final String domain = "http://192.168.1.14:3000/";

  FlashCardService() {
    dio = Dio();
  }

  String createUrl(String endpoint, String? args) {
    var url = "";

    args ??= "";

    url = domain + endpoint + args;
    return url;
  }

  void getRequest(String endpoint, {String? args}) async {
    await dio.get(createUrl(endpoint, args),
        options: Options(responseType: ResponseType.json));
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
    } on Exception catch (error) {
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
