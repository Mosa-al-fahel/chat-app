import 'package:dio/dio.dart';
import 'package:whishing/core/constants/api_url.dart';
import 'package:whishing/features/auth/signup/data/model/sign_up_body.dart';
import 'package:whishing/features/auth/signup/data/model/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';
part 'sign_up_remote_data.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class SignUpRemoteData {
  factory SignUpRemoteData(Dio dio, {String? baseUrl}) = _SignUpRemoteData;
  @POST(ApiUrls.signup)
  Future<SignUpResponseModel> signup(@Body() SignUpBody signupBody);
}
