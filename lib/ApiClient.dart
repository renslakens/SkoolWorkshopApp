import 'package:dio/dio.dart';
import 'Model/data.dart';
import 'apis.dart';
import 'package:retrofit/http.dart';
part 'ApiClient.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public-api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<ResponseData> getUsers();
}


// import 'package:retrofit/http.dart';
// import 'package:dio/dio.dart';
// import 'Model/ResponseData.dart';
// part 'ApiClient.g.dart';
//
// ///APIs class is for api tags
// class Apis {
//   static const String users = '/users';
// }
// @RestApi(baseUrl: "https://gorest.co.in/public-api/")
// abstract class ApiClient {
//   factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
//
//   @GET(Apis.users)
//   Future<ResponseData> getUsers();
// }