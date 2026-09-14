// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendFcmTokenBody _$SendFcmTokenBodyFromJson(Map<String, dynamic> json) =>
    SendFcmTokenBody(
      fcmToken: json['fcmToken'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$SendFcmTokenBodyToJson(SendFcmTokenBody instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'userId': instance.userId,
    };
