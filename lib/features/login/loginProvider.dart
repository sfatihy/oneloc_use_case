import 'package:oneloc_use_case/app/cacheManager.dart';
import 'package:oneloc_use_case/features/login/userLoginModel.dart';
import 'package:oneloc_use_case/features/login/userLoginResponseModel.dart';
import 'package:oneloc_use_case/service/authenticationService.dart';

class LoginProvider {

  final IAuthenticationService _authService = AuthenticationService();
  final CacheManager _cacheManager = CacheManager();

  Future<bool> loginUser(UserLoginModel model) async {
    UserLoginResponseModel response = await _authService.login(model);

    if (response.message == "Login_Successful") {
      await _cacheManager.saveEmail(response.data!.email.toString());
      await _cacheManager.saveSC(response.data!.registerStatus.toString());

      return true;
    }
    else {
      return false;
    }
  }
}