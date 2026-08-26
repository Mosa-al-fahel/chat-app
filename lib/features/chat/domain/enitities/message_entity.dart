class MessageEntity {
  String? id;
  String text;
  String? senderId;
  String? receiverId;
  DateTime? createdAt;
 
  MessageEntity(
      {required this.text,
      this.senderId,
      this.receiverId,
      this.id,
      this.createdAt,
});
}
