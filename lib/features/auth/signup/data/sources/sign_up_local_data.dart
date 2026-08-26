import 'package:whishing/core/constants/strings.dart';
import 'package:whishing/core/helper/shared_prefrences.dart';
import 'package:whishing/features/auth/signup/data/model/sign_up_response.dart';

class SignUpLocalData {
  static Future<void> cachedUserData(SignUpResponseModel userModel) async {
    await SharedPreference.setData(StringsConstants.userToken, userModel.token);
    await SharedPreference.setData(StringsConstants.userId, userModel.user!.id);
    await SharedPreference.setData(
        StringsConstants.userName, userModel.user!.username);

    await SharedPreference.setData(
        StringsConstants.userEmail, userModel.user!.email);
    await SharedPreference.setData(
        StringsConstants.userAvatar, userModel.user!.avatar);
  }
}
