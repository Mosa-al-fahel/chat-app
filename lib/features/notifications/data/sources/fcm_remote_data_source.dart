import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:whishing/core/constants/api_url.dart';
import 'package:whishing/features/notifications/data/model/fcm_token_body.dart';
part 'fcm_remote_data_source.g.dart';

@RestApi()
abstract class SyncFcmTokenRemoteDataSource {
  factory SyncFcmTokenRemoteDataSource(Dio dio, {String? baseUrl}) =
      _SyncFcmTokenRemoteDataSource;
  @PATCH(ApiUrls.fcmToken)
  Future<void> syncFcmToken(
     @Body() SendFcmTokenBody fcmrequestBody);
}
