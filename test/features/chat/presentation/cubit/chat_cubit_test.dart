import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/home/domain/usercases/home_usecases.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';

class MockHomeUsecaseTest extends Mock implements HomeUseCases {}

void main() {
  late MockHomeUsecaseTest homeUseCase;
  late HomePageCubit homePageCubit;
  setUp(() {
    homeUseCase = MockHomeUsecaseTest();
    homePageCubit = HomePageCubit(homeUseCase);
  });
  tearDown(() {
    homePageCubit.close();
  });
  List<UserEntity> testFriendsList = [
    UserEntity(id: '22l2pewpkvv', username: 'samer', email: 'sam13@gmail.com'),
    UserEntity(
        id: '25732pelmakvv', username: 'taher', email: 'taho33@gmail.com')
  ];
  blocTest<HomePageCubit, HomePageStates>(
    'testing home page cubit for exploring friends-success case',
    build: () {
      when(() => homeUseCase.call()).thenAnswer(
          (_) async => ApiResult<List<UserEntity>>.success(testFriendsList));
      return homePageCubit;
    },
    act: (bloc) => bloc.exploreFriends(),
    expect: () => [
      HomePageStates(suggestedState: PageStates.loading),
      HomePageStates(
          suggestedState: PageStates.success, suggustedList: testFriendsList)
    ],
  );
  ErrorModel errorModel = ErrorModel(message: 'error happened', status: false);
  blocTest<HomePageCubit, HomePageStates>(
    'testing home page cubit for exploring people-failure case',
    build: () {
      when(() => homeUseCase.call()).thenAnswer((_) async =>
          ApiResult<List<UserEntity>>.failed(
          errorModel));
      return homePageCubit;
    },
    act: (bloc) => bloc.exploreFriends(),
    expect: () => [
      HomePageStates(suggestedState: PageStates.loading),
      HomePageStates(
          suggestedState: PageStates.failure, suggustedError: errorModel)
    ],
  );
}
