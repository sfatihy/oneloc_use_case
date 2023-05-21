import 'dart:convert';
import 'dart:io';

import 'package:oneloc_use_case/features/home/userDeleteModel.dart';
import 'package:oneloc_use_case/features/home/userDeleteResponseModel.dart';
import 'package:oneloc_use_case/features/login/userLoginModel.dart';
import 'package:oneloc_use_case/features/login/userLoginResponseModel.dart';
import 'package:oneloc_use_case/features/register/userRegisterModel.dart';
import 'package:http/http.dart' as http;
import 'package:oneloc_use_case/features/register/userRegisterResponseModel.dart';

abstract class IAuthenticationService {
  String baseUrl = "https://case.onelocapp.com";

  headers() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json'
  };

  Future register(UserRegisterModel model);
  Future login(UserLoginModel model);
  Future deleteAccount(UserDeleteModel model);
}

class AuthenticationService extends IAuthenticationService {

  @override
  Future<UserRegisterResponseModel> register(UserRegisterModel model) async {
    final response = await http.post(Uri.parse("$baseUrl/api/User/register"), body: jsonEncode(model), headers: headers());

    switch (response.statusCode) {
      case HttpStatus.ok:
        return UserRegisterResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      default:
        throw Exception("Error at Register Module");
    }
  }

  @override
  Future<UserLoginResponseModel> login(UserLoginModel model) async {

    final response = await http.post(Uri.parse("$baseUrl/api/User/login?email=${model.email}&password=${model.password}"), headers: headers());

    switch (response.statusCode) {
      case HttpStatus.ok:
        return UserLoginResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      default:
        throw Exception("Error at Login Module");
    }
  }

  @override
  Future<UserDeleteResponseModel> deleteAccount(UserDeleteModel model) async {

    final response = await http.post(Uri.parse("$baseUrl/api/User/delete-my-account?email=${model.email}"), headers: headers());

    switch (response.statusCode) {
      case HttpStatus.ok:
        return UserDeleteResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      default:
        throw Exception("Error at User Delete Module");
    }
  }

}