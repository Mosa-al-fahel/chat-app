import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:whishing/core/data/local/cashed_user_data.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/home/domain/usercases/home_usecases.dart';
import 'package:whishing/features/notifications/domain/usecase/notifications_use_case.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  final HomeUseCases usesCases;
  List<UserEntity> contacts = [];
  List<UserEntity> suggustions = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController serachForExpController = TextEditingController();
  GlobalKey<FormState> fomrkeyExp = GlobalKey<FormState>();
  final NotificationsUseCase notificationsUsecase;

  GlobalKey<FormState> fomrkey = GlobalKey<FormState>();
  static final UserEntity _userData = GetUserCashedData.userCashedData;
  HomePageCubit(this.usesCases, this.notificationsUsecase)
      : super(HomePageStates());
  Future<void> initHomePage() async {
    exploreFriends();
    disPlayContants();
  }

  Future<void> exploreFriends() async {
    emit(state.copyWith(suggestedState: PageStates.loading));
    final response = await usesCases.call();
    switch (response) {
      case ApiSuccess(data: var exploriedFreindsList):
        suggustions = exploriedFreindsList;
        emit(state.copyWith(
            suggestedState: PageStates.success, suggustedList: suggustions));
      case ApiFailure(error: var error):
        emit(state.copyWith(
            suggestedState: PageStates.failure, suggustedError: error));
    }
  }

  void initDrawer() {
    emit(state.copyWith(profileData: _userData));
  }

  Future<void> disPlayContants() async {
    emit(state.copyWith(contactsState: PageStates.loading));
    final response = await usesCases.callFriends();
    switch (response) {
      case ApiSuccess(data: var contactsList):
        contacts = contactsList;

        if (contacts.isNotEmpty) {
          if (isClosed) return;
          emit(state.copyWith(
              contactsState: PageStates.success, contactsList: contacts));
        } else {
          if (isClosed) return;
          emit(state.copyWith(contactsState: PageStates.empty));
        }

      case ApiFailure(error: var error):
        if (isClosed) return;
        emit(state.copyWith(
            contactsState: PageStates.failure, contantsError: error));
    }
  }

  void resetAddingState() {
    emit(state.copyWith(addFreindState: PageStates.intial));
  }

  Future<void> addFriends({required String friendId}) async {
    emit(state.copyWith(addFreindState: PageStates.loading));
    final response = await usesCases.addFriend(friendId: friendId);
    switch (response) {
      case ApiSuccess():
        suggustions.removeWhere((element) => element.id == friendId);
        emit(state.copyWith(
            addFreindState: PageStates.success,
            suggustedList: List.from(suggustions)));

      case ApiFailure(error: var error):
        emit(state.copyWith(
            addFreindState: PageStates.failure, contantsError: error));
    }
  }

  void filterSuggustions() {
    if (serachForExpController.text.isNotEmpty) {
      List<UserEntity> filtSuggustions =
          filteredSuggustions(requiredContact: serachForExpController.text);

      if (state.suggestedState == PageStates.success) {
        if (filtSuggustions.isNotEmpty) {
          emit(state.copyWith(
              suggustedList: [...filtSuggustions],
              suggestedState: PageStates.success));
        } else {
          emit(state.copyWith(suggestedState: PageStates.emptySearch));
        }
      }
    } else {
      emit(state.copyWith(
          suggustedList: suggustions, suggestedState: PageStates.success));
    }
  }

  List<UserEntity> filteredSuggustions({required String requiredContact}) {
    return suggustions
        .where((contact) => contact.username!.contains(requiredContact))
        .toList();
  }

  void filterContacts() {
    if (searchController.text.isNotEmpty) {
      List<UserEntity> filtConacts =
          filteredContacts(requiredContact: searchController.text);

      if (state.contactsState == PageStates.success) {
        if (filtConacts.isNotEmpty) {
          emit(state.copyWith(
              contactsList: [...filtConacts],
              contactsState: PageStates.success));
        } else {
          emit(state.copyWith(contactsState: PageStates.emptySearch));
        }
      }
    } else {
      emit(state.copyWith(
          contactsList: contacts, contactsState: PageStates.success));
    }
  }

  List<UserEntity> filteredContacts({required String requiredContact}) {
    return contacts
        .where((contact) => contact.username!.contains(requiredContact))
        .toList();
  }

  Future<void>clearFcmToken() async{await  notificationsUsecase.clearFcmToken();}

  @override
  Future<void> close() {
    searchController.clear();
    searchController.dispose();
    return super.close();
  }
}
