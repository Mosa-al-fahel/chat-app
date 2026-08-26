part of 'home_page_cubit.dart';

enum PageStates { intial, loading, success, empty, failure , emptySearch}

class HomePageStates {
  final PageStates contactsState;
  final PageStates suggestedState;
  final PageStates addFreindState;
  final UserEntity? profileData;
  final ErrorModel? contantsError;
  final ErrorModel? suggustedError;
  final List<UserEntity> contactsList;
  final List<UserEntity> suggustedList;
  final ErrorModel? addindContactError;
  HomePageStates(
      {this.contactsState = PageStates.intial,
      this.suggestedState = PageStates.intial,
      this.addFreindState = PageStates.intial,
      this.contactsList = const [],
      this.suggustedList = const [],
      this.contantsError,
      this.profileData,
      this.suggustedError,
      this.addindContactError});
  HomePageStates copyWith(
      {PageStates? contactsState,
      PageStates? suggestedState,
      PageStates? addFreindState,
      ErrorModel? contantsError,
      ErrorModel? addindContactError,
      ErrorModel? suggustedError,
      List<UserEntity>? contactsList,
      List<UserEntity>? suggustedList,
      UserEntity? profileData}) {
    return HomePageStates(
        addFreindState: addFreindState ?? this.addFreindState,
        contactsState: contactsState ?? this.contactsState,
        suggestedState: suggestedState ?? this.suggestedState,
        contantsError: contantsError ?? this.contantsError,
        suggustedError: suggustedError ?? this.suggustedError,
        addindContactError: addindContactError ?? this.addindContactError,
        contactsList: contactsList ?? this.contactsList,
        suggustedList: suggustedList ?? this.suggustedList,
        profileData: profileData ?? this.profileData);
  }
}
