import 'package:json_annotation/json_annotation.dart';
import 'package:whishing/features/auth/login/domain/entites/login_entity.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends LoginEntity {
  
  LoginResponseModel(
      {required super.message, required super.token, required super.id});
     
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
