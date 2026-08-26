class UserEntity {
  String? id;
  String? username;
  String? email;
  String? avatar;
  List<String>? friends;
  String? lastMessage;
  DateTime? lastMessageTime;

  UserEntity({this.id, this.username, this.email, this.avatar, this.friends,this.lastMessage,this.lastMessageTime});
}
