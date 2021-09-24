// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$loggedUserAtom = Atom(name: '_AuthStoreBase.loggedUser');

  @override
  LoggedUserModel? get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(LoggedUserModel? value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  final _$errorAtom = Atom(name: '_AuthStoreBase.error');

  @override
  AuthException? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(AuthException? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AuthStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isValidEmailAtom = Atom(name: '_AuthStoreBase.isValidEmail');

  @override
  bool get isValidEmail {
    _$isValidEmailAtom.reportRead();
    return super.isValidEmail;
  }

  @override
  set isValidEmail(bool value) {
    _$isValidEmailAtom.reportWrite(value, super.isValidEmail, () {
      super.isValidEmail = value;
    });
  }

  final _$hidPasswordAtom = Atom(name: '_AuthStoreBase.hidPassword');

  @override
  bool get hidPassword {
    _$hidPasswordAtom.reportRead();
    return super.hidPassword;
  }

  @override
  set hidPassword(bool value) {
    _$hidPasswordAtom.reportWrite(value, super.hidPassword, () {
      super.hidPassword = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<Either<AuthException, LoggedUserModel>> login({LoginParams? params}) {
    return _$loginAsyncAction.run(() => super.login(params: params));
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  dynamic validateEmail(String email) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterPasswordView() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.alterPasswordView');
    try {
      return super.alterPasswordView();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
error: ${error},
isLoading: ${isLoading},
isValidEmail: ${isValidEmail},
hidPassword: ${hidPassword}
    ''';
  }
}
