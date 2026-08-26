import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:whishing/core/domain/user_entity.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class UserModel extends UserEntity {
  @override
  @HiveField(0)
  @JsonKey(name: '_id')
  // ignore: overridden_fields
  final String? id;
  @override
  @HiveField(1)
  final String? username;
  @override
  @HiveField(2)
  final String? email;
  @override
  @HiveField(3)
  final String? avatar;
  @override
  @HiveField(4)
  final List<String>? friends;
    @override
   @HiveField(5)
  final String? lastMessage;
    @override
   @HiveField(6)
  final DateTime ?lastMessageTime;

  UserModel({this.username, this.email, this.avatar, this.friends, this.id,this.lastMessage,this.lastMessageTime})
      : super(
            id: id,
            avatar: avatar,
            email: email,
            friends: friends,
            username: username,lastMessage: lastMessage,lastMessageTime: lastMessageTime);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  //Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
