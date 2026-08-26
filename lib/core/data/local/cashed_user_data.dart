import 'package:whishing/core/constants/strings.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/helper/shared_prefrences.dart';

class GetUserCashedData {
  GetUserCashedData._();
  static String? _token;
  static String? _userId;
  static String? _userName;
  static String? _userEmail;
  static String? _userAvatar;
  static bool ?_darkTheme;
  static bool get isItDark =>  _darkTheme ?? false ;
  static String? get getUserToken => _token;
  static String? get userId => _userId;
  static UserEntity get userCashedData =>
      UserEntity(username: _userName, email: _userEmail, avatar: _userAvatar);

  static Future<void> initUser() async {
    if (_userId == null) {
      final String? id =
            SharedPreference.sharedString(StringsConstants.userId);
      final String? name =
            SharedPreference.sharedString(StringsConstants.userName);
      final String? email =
            SharedPreference.sharedString(StringsConstants.userEmail);
      final String? avatar =
            SharedPreference.sharedString(StringsConstants.userAvatar);
      final String? tokn =
            SharedPreference.sharedString(StringsConstants.userToken);
      final bool ? theme =
            SharedPreference.sharedBool(StringsConstants.themeDark);

      _userId = id;
      _userEmail = email;
      _userName = name;
      _userAvatar = avatar;
      _token = tokn;
      _darkTheme = theme;
    } else {}
  }

  static Future<void> clearUserData() async {
    _userId = null;
    _userName = null;
    _userEmail = null;
    _userAvatar = null;
    _token = null;

    await SharedPreference.clearAll();
  }
}
