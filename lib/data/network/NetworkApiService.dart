import 'dart:convert';
import 'dart:io';

import 'package:mvvm_learn/data/app_exception.dart';
import 'package:mvvm_learn/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices with BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 404:
        throw BadRequestException(response.statusCode.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server' +
                response.statusCode.toString());
    }
  }
}
