  import 'package:equatable/equatable.dart';
class UserEntity extends Equatable{
 final String? id;
  final String? username;
  final String? email;
  final String? avatar;
  final List<String>? friends;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  const UserEntity({this.id, this.username, this.email, this.avatar, this.friends,this.lastMessage,this.lastMessageTime});
    @override
  List<Object?> get props => [
        id,
        username,
        email,
        avatar,
        friends,
        lastMessage,
        lastMessageTime,
      ];
  
  
}
