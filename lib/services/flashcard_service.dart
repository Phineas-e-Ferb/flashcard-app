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

  void postRequest(String endpoint, {String? args, dynamic body}) async {
    dio
        .post(createUrl(endpoint, args), data: body)
        .then(
          (value) => print(value),
        )
        .catchError((onError) => print(onError));
    //Todo try catch
  }

  void updateRequest(String endpoint, {String? args, dynamic body}) async {
    await dio.put(createUrl(endpoint, args), data: body);
    //Todo try catch
  }
}
