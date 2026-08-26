import 'package:json_annotation/json_annotation.dart';
part 'login_body_model.g.dart';

@JsonSerializable()
class LoginBodyModel {
  String email;
  String password;
  LoginBodyModel({required this.email, required this.password});
    Map<String, dynamic> toJson() => _$LoginBodyModelToJson(this);

}
