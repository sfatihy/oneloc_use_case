import 'package:oneloc_use_case/features/register/userRegisterModel.dart';
import 'package:oneloc_use_case/features/register/userRegisterResponseModel.dart';
import 'package:oneloc_use_case/service/authenticationService.dart';

class RegisterProvider {

  final IAuthenticationService _authService = AuthenticationService();

  Future<UserRegisterResponseModel> registerUser(UserRegisterModel model) async {
    return await _authService.register(model);
  }

}