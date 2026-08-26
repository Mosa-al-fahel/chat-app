import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/home/domain/repositories/home_repository.dart';

class HomeUseCases {
  final HomeRepository homeRepo;
  HomeUseCases(this.homeRepo);
  Future<ApiResult<List<UserEntity>>> call() async {
    return await homeRepo.explorePeople();
  }

  Future<ApiResult<List<UserEntity>>> callFriends() async {
    return await homeRepo.displayFirends();
  }

  Future<ApiResult<void>> addFriend({required String friendId}) async {
    return await homeRepo.addFriend(friendId);
  }
}
