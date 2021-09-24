import 'dart:convert';
import 'package:empresas_flutter/src/global_const.dart';
import 'package:empresas_flutter/src/modules/auth/domain/entities/logged_user.dart';
import 'package:empresas_flutter/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:empresas_flutter/src/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:http/http.dart' as http;

class AuthApi implements IAuthDatasource {
  @override
  Future<LoggedUserModel> login({LoginParams? params}) async {
    var response = await http.post(Uri.parse(API_URL + "users/auth/sign_in"),
        body: {"email": params!.email, "password": params.password});

    if (response.statusCode == 200) {
      return LoggedUserModel.fromJsonSucess(response.headers);
    } else {
      return LoggedUserModel.fromJsonError(json.decode(response.body));
    }
  }
}
