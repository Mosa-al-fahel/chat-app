import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
part 'message_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class MessageModel extends MessageEntity {
  @override
  @HiveField(0)
  @JsonKey(name: '_id')
  final String? id;
  @override
  @HiveField(1)
  final String? receiverId;
  @override
  @HiveField(2)
  final String? senderId;
  @override
  @HiveField(3)
  final String text;
  @override
  @HiveField(4)
  final DateTime? createdAt;
 

  MessageModel(
      {this.id,
      this.receiverId,
      this.senderId,
      required this.text,
      this.createdAt })
      : super(
            id: id,
            text: text,
            
            receiverId: receiverId,
            senderId: senderId,
            createdAt: createdAt);
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      senderId: senderId,
      receiverId: receiverId,
      createdAt: createdAt,
      text: text,
    );
  }
}
