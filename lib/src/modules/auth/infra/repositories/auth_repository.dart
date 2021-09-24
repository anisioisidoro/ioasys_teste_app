
import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/auth/domain/entities/logged_user.dart';
import 'package:empresas_flutter/src/modules/auth/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/auth/domain/interfaces/auth_interface.dart';
import 'package:empresas_flutter/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:empresas_flutter/src/modules/auth/infra/datasources/auth_datasource.dart';


class AuthRepository implements IAuthRepository{

  final IAuthDatasource? authDatasource;

  AuthRepository({this.authDatasource});
  @override
  Future<Either<AuthException, LoggedUserModel>> login({LoginParams? params}) async{
    try {
      final user = await  authDatasource!.login(params: params!);

      return Right(user);
    } on  AuthException catch(e){
      return Left(e);
    } on Exception{
      return Left(AuthException("Erro, verifique a conexão de internet"));
    }
  }

}