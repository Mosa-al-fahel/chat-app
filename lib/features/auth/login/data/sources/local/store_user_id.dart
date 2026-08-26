import 'package:whishing/core/constants/strings.dart';
import 'package:whishing/core/helper/shared_prefrences.dart';

class CashedUserId {
  CashedUserId._();
  static Future<void> storeUserId(String? userId) async {
    if (userId !=null) {
      await SharedPreference.setData(StringsConstants.userId, userId);
    } else {}
  }
   static Future<void> storeUserToken(String? token) async {
    if (token !=null) {
      await SharedPreference.setData(StringsConstants.userToken, token);
    } else {}
  }
}


