import 'package:json_annotation/json_annotation.dart';
part 'fcm_token_body.g.dart';

@JsonSerializable()
class SendFcmTokenBody {
  String? fcmToken;
  String? userId;
  SendFcmTokenBody({this.fcmToken, this.userId});

  Map<String, dynamic> toJson() => _$SendFcmTokenBodyToJson(this);
}
