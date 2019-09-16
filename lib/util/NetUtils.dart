import 'package:dio/dio.dart';

class NetUtils {
  static Future get({url, onCallBack}) async {
    try {
      Response response = await Dio().get(url);
      onCallBack(response.toString());
    } catch (e) {
      print(e);
    }
  }
}
