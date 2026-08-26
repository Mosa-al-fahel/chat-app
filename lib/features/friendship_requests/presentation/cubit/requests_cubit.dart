import 'package:bloc/bloc.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/friendship_requests/domain/usecases/requests_usecase.dart';
part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit(this._usecase) : super(RequestsState());
  final RequestsUsecase _usecase;
  List<UserEntity> requestsForMe = const [];

  Future<void> getRequests() async {
    emit(state.copyWith(pageState: RequestsPageState.loading));
    final response = await _usecase.call();
    switch (response) {
      case ApiSuccess(data: var data):
        requestsForMe = data;
        if (requestsForMe.isNotEmpty) {
          if (isClosed) return;
          emit(state.copyWith(
              pageState: RequestsPageState.success,
              requestsList: requestsForMe));
        } else {
          if (isClosed) return;

          emit(state.copyWith(pageState: RequestsPageState.empty));
        }

      case ApiFailure(error: var error):
        if (isClosed) return;

        emit(state.copyWith(
            pageState: RequestsPageState.failure, getRequestsError: error));
    }
  }

  Future<void> acceptFriendRequest({required String senderId}) async {
    requestsForMe.removeWhere((element) => element.id == senderId);

    final response = await _usecase.acceptFriendRequest(senderId: senderId);

    switch (response) {
      case ApiSuccess():
        emit(state.copyWith(
            requestsList: List.from(requestsForMe),
            pageState: requestsForMe.isEmpty
                ? RequestsPageState.empty
                : RequestsPageState.success));
      case ApiFailure(error: var error):
        emit(state.copyWith(
            pageState: RequestsPageState.failure, addingError: error));
    }
  }
}
