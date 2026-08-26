import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:whishing/core/constants/api_url.dart';
import 'package:whishing/core/data/model/user_model.dart';
part 'home_remote_data.g.dart';
@RestApi()
abstract class HomeRemoteData {
  factory HomeRemoteData(Dio dio, {String? baseUrl}) = _HomeRemoteData;
  @GET(ApiUrls.exploreFriends)
  Future<List<UserModel>> explorePeople();
   @GET(ApiUrls.firendsList)
  Future<List<UserModel>> displayFreinds();
  @POST(ApiUrls.addFriend)
  Future<void> addFriend(@Field() String friendId);
  // @POST(ApiUrls.removeFriend)
  // Future<void> removeFriend(@Field() int userId);

}

 