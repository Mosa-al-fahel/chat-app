import 'package:json_annotation/json_annotation.dart';

part 'sign_up_body.g.dart';

@JsonSerializable()
class SignUpBody {
  @JsonKey(name: 'username')
  String userName;
  String email;
  String password;
  SignUpBody(
      {required this.userName, required this.email, required this.password});
  Map<String, dynamic> toJson() => _$SignUpBodyToJson(this);
}
