import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';
import 'package:whishing/features/chat/data/model/message_model.dart';

class SocketService {
  IO.Socket? socket;
  SocketService._internal();
  static final SocketService _instanse = SocketService._internal();
  factory SocketService() => _instanse;
  String? _lastMessage;
  String? get lastMessage => _lastMessage;
  final _typingStreamController = StreamController<bool>.broadcast();
  final _messageStreamController = StreamController<MessageModel>.broadcast();
  Stream<MessageModel> get messageStream => _messageStreamController.stream;
  Stream<bool> get typingStream => _typingStreamController.stream;

  void init(String userID) {
    print('UserId IS : $userID');
    socket = IO.io(
        'http://10.0.2.2:8001',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket!.connect();
    socket!.onConnect((_) {
      print('تم الاتصال بالسيرفر بنجاح');
      socket!.emit('join', userID);
    });

    socket!.on('receiveMessage', (data) {
      final message = MessageModel.fromJson(data);
      _messageStreamController.add(message);
     
    });
    socket!.on('userTyping', (data) {
      final isTyping = data['isTyping'];
      _typingStreamController.add(isTyping);
    });

    socket!.onDisconnect((_) => print('تم قطع الاتصال'));
  }

  void emitMessage(MessageModel data) {
    if (socket != null || socket!.connected) {
      socket!.emit('sendMessage', data.toJson());
    } else {
      print('socket cannot send messae');
    }
  }

  void emitTyping(String receiverId, String senderId, bool isTyping) {
    socket!.emit('typing', {
      'senderId': senderId,
      'receiverId': receiverId,
      'isTyping': isTyping,
    });
  }

  void dispose() {
    socket!.disconnect();
    _messageStreamController.close();
    _typingStreamController.close();
  }
}


// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class SocketService {
//   static final SocketService _instance = SocketService._internal();
//   factory SocketService() => _instance;
//   SocketService._internal();

//   late IO.Socket socket;

//   // Change to Future<void> and make it async
//   Future<void> initSocket() async {
//     // 1. Fetch the userId from SharedPreferences
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String? userId = prefs.getString('userId'); // Ensure key matches your login save logic

//     if (userId == null) {
//       print('Socket Initialization Failed: No userId found in storage.');
//       return;
//     }

//     // 2. Configure and pass the userId in the auth payload
//     socket = IO.io(
//       'http://YOUR_SERVER_URL:3000',
//       IO.OptionBuilder()
//           .setTransports(['websocket'])
//           .disableAutoConnect()
//           // Passing data in setAuth makes it accessible on the server during connection
//           .setAuth({'userId': userId}) 
//           .build(),
//     );

//     // 3. Connect manually
//     socket.connect();

//     // Lifecycle Listeners
//     socket.onConnect((_) => print('Connected with User ID: $userId'));
//     socket.onDisconnect((_) => print('Disconnected'));
//   }
// }
