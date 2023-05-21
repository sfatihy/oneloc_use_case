import 'package:oneloc_use_case/app/cacheManager.dart';
import 'package:oneloc_use_case/features/home/userDeleteModel.dart';
import 'package:oneloc_use_case/features/home/userDeleteResponseModel.dart';
import 'package:oneloc_use_case/service/authenticationService.dart';

class HomeProvider {

  final IAuthenticationService _authService = AuthenticationService();
  final CacheManager _cacheManager = CacheManager();

  Future logout() async {
    await _cacheManager.deleteEmail();
    await _cacheManager.deleteSC();
  }

  Future<UserDeleteResponseModel> deleteAccount() async {

    String? email = await _cacheManager.getEmail();

    UserDeleteModel model = UserDeleteModel(
      email: email ?? ""
    );

    logout();

    return await _authService.deleteAccount(model);
  }

}