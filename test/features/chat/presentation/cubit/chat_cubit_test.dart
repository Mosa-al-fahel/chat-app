import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
import 'package:whishing/features/chat/domain/usecases/get_messages.dart';
import 'package:whishing/features/chat/domain/usecases/listen_to_messages.dart';
import 'package:whishing/features/chat/domain/usecases/listen_to_typing.dart';
import 'package:whishing/features/chat/domain/usecases/send_message.dart';
import 'package:whishing/features/chat/domain/usecases/send_typing_state.dart';
import 'package:whishing/features/chat/presentation/cubit/chat_cubit.dart';

class MockgetMessagesUseCase extends Mock implements GetMessagesUseCase {}

class MockTypingTrakcingUseCase extends Mock implements ListenToTypingUseCase {}

class MockSendMessageUseCase extends Mock implements SendMessageUseCase {}

class MockSendTypingUseCase extends Mock implements SendTypingStateUseCase {}

class MockListenToMessagesUseCase extends Mock
    implements ListenToMessagesUseCase {}

void main() {
  late MockgetMessagesUseCase mockgetMessagesUseCase;
  late MockTypingTrakcingUseCase mckTypingTrakcingUseCase;
  late MockSendMessageUseCase mockSendMessageUseCase;
  late MockSendTypingUseCase mockSendTypingUseCase;
  late MockListenToMessagesUseCase mockListenToMessagesUseCaseUseCase;
  final String senderId = 's;fkslgks';
  final String recieverId = 'reciever1zx';

  //late ChatCubit chatCubit;
  // ignore: no_leading_underscores_for_local_identifiers
  ChatCubit _getChatCubit() {
    return ChatCubit(
        userId: senderId,
        trackingTypingUseCase: mckTypingTrakcingUseCase,
        sendMessageUseCase: mockSendMessageUseCase,
        getMessagesUseCase: mockgetMessagesUseCase,
        listenToMessagesUseCase: mockListenToMessagesUseCaseUseCase,
        sendTypingStateUseCase: mockSendTypingUseCase);
  }

  setUp(() {
    mockgetMessagesUseCase = MockgetMessagesUseCase();
    mckTypingTrakcingUseCase = MockTypingTrakcingUseCase();
    mockSendMessageUseCase = MockSendMessageUseCase();
    mockListenToMessagesUseCaseUseCase = MockListenToMessagesUseCase();
    mockSendTypingUseCase = MockSendTypingUseCase();
    _getChatCubit();
    //  chatCubit = _getChatCubit();
  });

  List<MessageEntity> tListMessages = [
    MessageEntity(
        text: 'hello',
        createdAt: DateTime.now(),
        receiverId: recieverId,
        senderId: senderId),
    MessageEntity(
        text: 'helaflo',
        createdAt: DateTime.now(),
        receiverId: recieverId,
        senderId: senderId)
  ];
  blocTest<ChatCubit, ChatState>(
    'test get messaging state flow',
    build: () {
      when(() => mockListenToMessagesUseCaseUseCase.listenToMessages())
          .thenAnswer((_) => const Stream.empty());

      when(() => mckTypingTrakcingUseCase.listenToTypingStream())
          .thenAnswer((_) => const Stream.empty());
      when(() => mockgetMessagesUseCase.call(senderId, recieverId)).thenAnswer(
          (_) async => ApiResult<List<MessageEntity>>.success(tListMessages));
      return _getChatCubit();
    },
    act: (bloc) => bloc.initChat(recieverId),
    expect: () => [isA<ChatLoading>(), isA<ChatLoaded>()],
  );
}
