import 'package:whishing/features/chat/data/sources/remote/socket_connect.dart';

class ConnectToSocket {
  static void connectSocket(String? userId) {
    if (userId != null) {
      SocketService().init(userId);
    } else {}
  }
}
