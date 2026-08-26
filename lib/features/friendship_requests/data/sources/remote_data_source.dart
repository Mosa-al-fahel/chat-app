import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:whishing/core/constants/api_url.dart';
import 'package:whishing/core/data/model/user_model.dart';
part 'remote_data_source.g.dart';

@RestApi()
abstract class RequestsRemoteDataSources {
  factory RequestsRemoteDataSources(Dio dio, {String? baseUrl})=
      _RequestsRemoteDataSources;
  @GET(ApiUrls.requests)
  Future<List<UserModel>> geMytRequests();
  @POST(ApiUrls.acceptRequests)
  Future<void> acceptFriendRequest({@Field('senderId') required String senderId  });
}
