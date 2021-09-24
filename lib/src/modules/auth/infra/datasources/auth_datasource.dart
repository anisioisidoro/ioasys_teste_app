
import 'package:empresas_flutter/src/modules/auth/domain/entities/logged_user.dart';
import 'package:empresas_flutter/src/modules/auth/domain/usecases/login_usecase.dart';

abstract class IAuthDatasource {
  Future<LoggedUserModel> login({LoginParams params});
}
