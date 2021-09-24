import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/auth/domain/entities/logged_user.dart';
import 'package:empresas_flutter/src/modules/auth/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:empresas_flutter/src/service/local_storage_service/local_storage_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final ILoginUseCase? repository;

  final ILocalStorage? storage;

  _AuthStoreBase({this.repository, this.storage});

  @observable
  LoggedUserModel? loggedUser;

  @observable
  AuthException? error;

  @observable
  bool isLoading = false;

  @observable
  bool isValidEmail = true;

  @observable
  bool hidPassword = true;

  @action
  Future<Either<AuthException, LoggedUserModel>> login({LoginParams? params}) async {
    try {
      isLoading = true;
      var result = await repository!.login(params: params!);

      //get the data coming from the api, the l is to get the data on the left side, in this case the errors
      //the r is to get the data on the right side, when the request was successful

      return result.fold((l) {
        error = l;
        return Left(error!);
      }, (r) {
        if (r.success) {
          saveAuthData(loggedUser: r);

          return Right(loggedUser = r);
        }
        error = AuthException(r.errors![0]);
        return Left(error!);
      });
    } finally {
      isLoading = false;
    }
  }

//method to validate the email
  @action
  validateEmail(String email) {
    if (isEmail(email)) {
      isValidEmail = true;
    } else {
      isValidEmail = false;
    }
  }

  //method to change the state of the password field
  @action
  alterPasswordView() {
    hidPassword = !hidPassword;
  }

  //method for saving user login information
  saveAuthData({LoggedUserModel? loggedUser}) {
    storage?.put(key: "token", value: loggedUser!.accessToken.toString());
    storage?.put(key: "uid", value: loggedUser!.uid.toString());
    storage?.put(key: "client", value: loggedUser!.client.toString());
  }
}
