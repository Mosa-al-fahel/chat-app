import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
import 'package:whishing/features/chat/domain/repositories/chat_repository.dart';
import 'package:whishing/features/chat/domain/usecases/get_messages.dart';
import 'package:whishing/features/chat/domain/usecases/send_message.dart';
// استيراد الـ Entities و الـ ApiResult الخاصة بك

class MockChatRepository extends Mock implements ChatRepository {}

void main() {
  late MockChatRepository mockChatRepository;
  late SendMessageUseCase sendMessageUseCase;
  late GetMessagesUseCase getMessagesUseCase;
  setUp(() {
    mockChatRepository = MockChatRepository();
    sendMessageUseCase = SendMessageUseCase(mockChatRepository);
    getMessagesUseCase = GetMessagesUseCase(mockChatRepository);
  });
  group('make tests for chat screen', () {
    test('getmessages should return a list of message entity', () async {
      //arrange
      List<MessageEntity> testMessages = [
        MessageEntity(
            text: 'hello ',
            createdAt: DateTime.now(),
            id: '90w8uijej',
            receiverId: '3209ui',
            senderId: 'welfdsf'),
      ];
      when(() => mockChatRepository.getMessages(
              senderId: 'welfdDDsf', receiverId: 'Md23209ui'))
          .thenAnswer((_) async => ApiResult.success(testMessages));
      //action
      final result = await getMessagesUseCase("welfdDDsf", "Md23209ui");
      expect(result, ApiResult.success(testMessages));
      //assert
    });
  });
  test('testing sending messages', () async {
    //arrange
    MessageEntity testmessagesContent = MessageEntity(
        text: 'heelo ',
        createdAt: DateTime.now(),
        id: '90w8u%%ijej',
        receiverId: 'Md23209ui',
        senderId: 'welfdDDsf');
    when(() =>
            mockChatRepository.sendMessage(messageContent: testmessagesContent))
        .thenAnswer((_) async => ApiResult<void>.success(null));
    //action
    final result = await sendMessageUseCase(messageContent: testmessagesContent);
    expect(result, ApiResult<void>.success(null));
    //assert
  });
}
