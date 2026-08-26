part of 'requests_cubit.dart';

enum RequestsPageState { intial, loading, success, empty, failure }

class RequestsState {
  final RequestsPageState pageState;
  final RequestsPageState acceptingState;
  final List<UserEntity> requestsList;
  final ErrorModel? getRequestsError;
  final ErrorModel? addingError;

  RequestsState(
      {this.pageState = RequestsPageState.intial,
      this.acceptingState = RequestsPageState.intial,
      this.requestsList = const [],
      this.getRequestsError,
      this.addingError});
  RequestsState copyWith(
      {RequestsPageState? pageState,
      RequestsPageState? acceptingState,
      List<UserEntity>? requestsList,
      ErrorModel? getRequestsError,
      ErrorModel? addingError}) {
    return RequestsState(
        pageState: pageState ?? this.pageState,
        acceptingState: acceptingState ?? this.acceptingState,
        requestsList: requestsList ?? this.requestsList,
        getRequestsError: getRequestsError ?? this.getRequestsError,
        addingError: addingError ?? this.addingError);
  }
}
