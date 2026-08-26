// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpBody _$SignUpBodyFromJson(Map<String, dynamic> json) => SignUpBody(
      userName: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpBodyToJson(SignUpBody instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'email': instance.email,
      'password': instance.password,
    };
