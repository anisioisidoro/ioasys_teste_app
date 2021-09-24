import 'package:empresas_flutter/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:empresas_flutter/src/modules/auth/external/auth_api.dart';
import 'package:empresas_flutter/src/modules/auth/infra/repositories/auth_repository.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/usecases/enterprise_usecase.dart';
import 'package:empresas_flutter/src/modules/enterprise/external/enterprise_api.dart';
import 'package:empresas_flutter/src/modules/enterprise/infra/repositories/enterprise_repository.dart';
import 'package:empresas_flutter/src/service/local_storage_service/local_storage_service.dart';
import 'package:empresas_flutter/src/stores/enterprise_store/enterprise_store.dart';
import 'package:empresas_flutter/src/stores/user_store/auth_store.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(AuthStore(
      repository: LoginUseCase(
        repository: AuthRepository(authDatasource: AuthApi()),
      ),
      storage: LocalStorageService()));

  locator.registerSingleton(EnterpriseStore(
      repository: EnterpriseUseCase(
          repository:
              EnterpriseRepository(enterprisehDatasource: EnterpriseApi()))));
}
