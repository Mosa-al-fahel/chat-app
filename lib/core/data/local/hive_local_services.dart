
import 'package:hive_ce/hive.dart';

class HiveLocalServices<T> {
  Future<Box<T>> initialBox(String boxKey) async {
    if (Hive.isBoxOpen(boxKey)) {
      return Hive.box<T>(boxKey);
    } else {
      return await Hive.openBox<T>(boxKey);
    }
  }

  Future<void> storeListOfData(String boxKey, List<T> data,
      {int? limit}) async {
    var box = await initialBox(boxKey);
    box.clear();
    final int length = data.length;
    limit ??= 25;
    if (length > 25) {
      final briefList = data.sublist(length - limit);
      await box.addAll(briefList);
    } else {
      await box.addAll(data);
    }
  }

  Future<List<T>> getStoredList(String boxKey) async {
    var box = await initialBox(boxKey);
    return box.values.toList();
  }

  Future<void> cacheSingleMessage(String? boxKey, T eliment) async {
    var box = await initialBox(boxKey!);
    await box.add(eliment);
  }
}
