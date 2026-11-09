import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';

import 'package:whishing/features/home/domain/repositories/home_repository.dart';
import 'package:whishing/features/home/domain/usercases/home_usecases.dart';
// استيراد الـ Entities و الـ ApiResult الخاصة بك

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeUseCases usecase;
  late MockHomeRepository mockHomeRepository;
  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = HomeUseCases(mockHomeRepository);
  });

  group('test home screen usecases', () {
    test(
        'should return list of contacts successfully when repository call succeeds',
        () async {
      // arrange
      List<UserEntity> testContactsList = [
        UserEntity(
            email: 'emailxx@gmail.com',
            id: 'coaks34xx!@',
            avatar: '',
            username: 'hasasa'),
        UserEntity(
            email: 'emailxasapskf@gmail.com',
            id: 'coadafadfks34xx!@',
            avatar: '',
            username: 'haasfaga23sasa')
      ];
      when(() => mockHomeRepository.displayFirends())
          .thenAnswer((_) async => ApiResult.success(testContactsList));
      //action

      final result = await usecase.callFriends();
      // verification
      expect(result, ApiResult.success(testContactsList));
      verify(() => mockHomeRepository.displayFirends()).called(1);
    });
    test(
        'should return list of suggustions successfully when repository call succeeds',
        () async {
      // arrange
      List<UserEntity> testSuggustionsList = [
        UserEntity(
            email: 'asadHH@gmail.com',
            id: 'coaks34xsa@@x!@',
            avatar: '',
            username: 'hamaeer'),
        UserEntity(
            email: 'emailxasapdafaskf@gmail.com',
            id: 'coadafadfks34xxasd!@',
            avatar: '',
            username: 'haasfaga23sasa')
      ];
      when(() => mockHomeRepository.explorePeople())
          .thenAnswer((_) async => ApiResult.success(testSuggustionsList));
      //action

      final result = await usecase.call();
      // verification
      expect(result, ApiResult.success(testSuggustionsList));
      verify(() => mockHomeRepository.explorePeople()).called(1);
    });
  });
  test('should return api failed in case request failed', () async {
    // arrange
    ErrorModel testFailureReponse =
        ErrorModel(message: 'failed, no internet connection', status: false);
    when(() => mockHomeRepository.explorePeople())
        .thenAnswer((_) async => ApiResult<List<UserEntity>>.failed(testFailureReponse));
    //action

    final result = await usecase.call();
    // verification
    expect(result, ApiResult<List<UserEntity>>.failed(testFailureReponse));
    verify(() => mockHomeRepository.explorePeople()).called(1);
  });
}
