import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/auth/domain/entities/logged_user.dart';
import 'package:empresas_flutter/src/modules/auth/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/auth/domain/interfaces/auth_interface.dart';
import 'package:validators/validators.dart';

abstract class ILoginUseCase {
  Future<Either<AuthException, LoggedUserModel>> login({LoginParams params});
}

class LoginUseCase implements ILoginUseCase {
  final IAuthRepository? repository;

  LoginUseCase({this.repository});

  @override
  Future<Either<AuthException, LoggedUserModel>> login({LoginParams? params}) async {
    if (!isEmail(params!.email??"")) {
      return Left(AuthException("Email invalido"));
    }

    if (params.password!.isEmpty) {
      return Left(AuthException("Password invalida"));
    }

    return await repository!.login(params: params);
  }
}

class LoginParams {
  final String? email;
  final String? password;

  LoginParams({this.email, this.password});
}
