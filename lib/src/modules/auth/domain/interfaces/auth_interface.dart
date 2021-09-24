import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/auth/domain/entities/logged_user.dart';
import 'package:empresas_flutter/src/modules/auth/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/auth/domain/usecases/login_usecase.dart';


abstract class IAuthRepository{
  Future<Either<AuthException,LoggedUserModel>> login({LoginParams params});
}