import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:whishing/core/constants/api_url.dart';
import 'package:whishing/features/auth/login/data/model/login_body_model.dart';
import 'package:whishing/features/auth/login/data/model/login_response_model.dart';
part 'login_remote_data.g.dart';

@RestApi()
abstract class LoginRemoteData {
  factory LoginRemoteData(Dio dio, {String? baseUrl}) = _LoginRemoteData;
  @POST(ApiUrls.login)
  Future<LoginResponseModel> login(@Body() LoginBodyModel loginBody);
}
