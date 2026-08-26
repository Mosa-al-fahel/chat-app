import 'package:json_annotation/json_annotation.dart';
import 'package:whishing/core/data/model/user_model.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponseModel {
 String ? message;
  bool ?status;
  UserModel? user;
  String ?token;
   
  SignUpResponseModel(this.user, this.token, this.message, this.status);
  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
}
