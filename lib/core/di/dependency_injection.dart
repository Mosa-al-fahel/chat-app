import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:whishing/core/data/local/hive_local_services.dart';
import 'package:whishing/core/data/model/user_model.dart';
import 'package:whishing/core/network/network.dart';
import 'package:whishing/features/chat/data/model/message_model.dart';
import 'package:whishing/features/chat/data/repositories/chat_reposetory_imp.dart';
import 'package:whishing/features/chat/data/sources/remote/chat_remote_data_source.dart';
import 'package:whishing/features/chat/data/sources/remote/socket_connect.dart';
import 'package:whishing/features/chat/domain/usecases/get_messages.dart';
import 'package:whishing/features/chat/domain/usecases/listen_to_messages.dart';
import 'package:whishing/features/chat/domain/usecases/listen_to_typing.dart';
import 'package:whishing/features/chat/domain/usecases/send_message.dart';
import 'package:whishing/features/chat/domain/usecases/send_typing_state.dart';
import 'package:whishing/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:whishing/features/friendship_requests/data/repository/requests_repository_imp.dart';
import 'package:whishing/features/friendship_requests/data/sources/remote_data_source.dart';
import 'package:whishing/features/friendship_requests/domain/usecases/requests_usecase.dart';
import 'package:whishing/features/friendship_requests/presentation/cubit/requests_cubit.dart';
import 'package:whishing/features/home/data/repository/home_repo_imp.dart';
import 'package:whishing/features/home/data/sources/remote/home_remote_data.dart';
import 'package:whishing/features/home/domain/usercases/home_usecases.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';
import 'package:whishing/features/auth/login/data/repositories/login_repository_imp.dart';
import 'package:whishing/features/auth/login/data/sources/remote/login_remote_data.dart';
import 'package:whishing/features/auth/login/domain/usecase/login_usecase.dart';
import 'package:whishing/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:whishing/features/auth/signup/data/repositories/sign_up.dart';
import 'package:whishing/features/auth/signup/data/sources/sign_up_remote_data.dart';
import 'package:whishing/features/auth/signup/domain/usecases/sign_up.dart';
import 'package:whishing/features/auth/signup/presentation/cubit/sign_up_cubit.dart';

GetIt getIt = GetIt.instance;

void configureDependencies() {
  Dio dio = DioFactory.getDio();
  //sign up
  getIt.registerLazySingleton<SignUpRemoteData>(() => SignUpRemoteData(dio));
  getIt.registerLazySingleton<SignUpRepositoryImp>(
      () => SignUpRepositoryImp(getIt<SignUpRemoteData>()));
  getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(getIt<SignUpRepositoryImp>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpUseCase>()));
  //login
  getIt.registerLazySingleton<LoginRemoteData>(() => LoginRemoteData(dio));
  getIt.registerLazySingleton<LoginRepositoryImp>(
      () => LoginRepositoryImp(getIt<LoginRemoteData>()));
  getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(getIt<LoginRepositoryImp>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUsecase>()));
  //home page
  getIt.registerLazySingleton<HiveLocalServices<UserModel>>(
      () => HiveLocalServices<UserModel>());

  getIt.registerLazySingleton<HomeRemoteData>(() => HomeRemoteData(dio));
  getIt.registerLazySingleton<HomeRepoImp>(() => HomeRepoImp(
      getIt<HomeRemoteData>(), getIt<HiveLocalServices<UserModel>>()));
  getIt.registerLazySingleton<HomeUseCases>(
      () => HomeUseCases(getIt<HomeRepoImp>()));
  getIt.registerFactory<HomePageCubit>(
      () => HomePageCubit(getIt<HomeUseCases>()));
  // requests
  getIt.registerLazySingleton<RequestsRemoteDataSources>(
      () => RequestsRemoteDataSources(dio));
  getIt.registerLazySingleton<RequestsRepositoryImp>(
      () => RequestsRepositoryImp(getIt<RequestsRemoteDataSources>()));
  getIt.registerLazySingleton<RequestsUsecase>(
      () => RequestsUsecase(getIt<RequestsRepositoryImp>()));
  getIt.registerFactory<RequestsCubit>(
      () => RequestsCubit(getIt<RequestsUsecase>()));
  //chat screen dependencies
  getIt.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSource(dio));
  getIt.registerLazySingleton<SocketService>(() => SocketService());
  getIt.registerLazySingleton<HiveLocalServices<MessageModel>>(
      () => HiveLocalServices<MessageModel>());
  getIt.registerLazySingleton<ChatReposetorysImp>(() => ChatReposetorysImp(
      getIt<ChatRemoteDataSource>(),
      getIt<SocketService>(),
      getIt<HiveLocalServices<MessageModel>>()));
  getIt.registerLazySingleton<SendMessageUseCase>(
      () => SendMessageUseCase(getIt<ChatReposetorysImp>()));
  //
  getIt.registerLazySingleton<GetMessagesUseCase>(
      () => GetMessagesUseCase(getIt<ChatReposetorysImp>()));
  getIt.registerLazySingleton<ListenToTypingUseCase>(
      () => ListenToTypingUseCase(getIt<ChatReposetorysImp>()));
  getIt.registerLazySingleton<SendTypingStateUseCase>(
      () => SendTypingStateUseCase(getIt<ChatReposetorysImp>()));
  //
  getIt.registerLazySingleton<ListenToMessagesUseCase>(
      () => ListenToMessagesUseCase(getIt<ChatReposetorysImp>()));
  getIt.registerFactory<ChatCubit>(() => ChatCubit(

      sendMessageUseCase: getIt<SendMessageUseCase>(),
      getMessagesUseCase: getIt<GetMessagesUseCase>(),
      listenToMessagesUseCase: getIt<ListenToMessagesUseCase>(),
      sendTypingStateUseCase: getIt<SendTypingStateUseCase>(),
      trackingTypingUseCase: getIt<ListenToTypingUseCase>()));
}
