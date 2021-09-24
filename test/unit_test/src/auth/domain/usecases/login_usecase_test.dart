import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/auth/domain/entities/logged_user.dart';
import 'package:empresas_flutter/src/modules/auth/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/auth/domain/interfaces/auth_interface.dart';
import 'package:empresas_flutter/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AuthRepositoryMock extends Mock  implements IAuthRepository {
  @override
  Future<Either<AuthException, LoggedUserModel>> login( {LoginParams? params}) async {
    return Right(LoggedUserModel(
      accessToken: "accessToken",
      client: "client",
      success: true,
      uid: "uid"
    ));
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUseCase(repository: repository);
  test('should login successfully', () async {

    final result = await usecase.login(
      params: LoginParams(email: "anisiogomes@gmail.com", password: "123") );

    expect(result.isRight(), true);

    expect(result.getOrElse(() => LoggedUserModel()).success, true);
  });
  
  test('should give error when email is invalid', () async {

    final result = await usecase.login(
        params: LoginParams(email: "anisiogomes@gmail", password: "123"));

    expect(result.isLeft(), true);
  });

  test('should give error when password is invalid', () async {
    final result = await usecase.login(
        params: LoginParams(email: "anisiogomes@gmail", password: ""));

    expect(result.isLeft(), true);
  });
}
