 import 'package:hive_ce/hive.dart';
import 'package:whishing/features/chat/data/model/message_model.dart';

class LocalStoredMessages {
  LocalStoredMessages();
  Future<Box<MessageModel>> initialBox(String chatID) async {
    if (Hive.isBoxOpen(chatID)) {
      return Hive.box<MessageModel>(chatID);
    }
    return await Hive.openBox<MessageModel>(chatID);
  }
  

   

  Future<void> storeMessages(
      String chatId, List<MessageModel> messagesList) async {
    var box = await initialBox(chatId);
    final int listLength = messagesList.length;
    await box.clear();
    if (messagesList.length > 25) {
      final List<MessageModel> briefList =
          messagesList.sublist(listLength - 25);
      await box.addAll(briefList);
    } else {
      await box.addAll(messagesList);
    }
  }

  Future<List<MessageModel>> getStoredMessages(String chatID) async {
    var box = await initialBox(chatID);
    return box.values.toList();
  }
}
