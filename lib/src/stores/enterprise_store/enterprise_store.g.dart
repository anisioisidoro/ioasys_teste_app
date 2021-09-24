// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnterpriseStore on _EnterpriseStoreBase, Store {
  final _$enterpriseModelAtom =
      Atom(name: '_EnterpriseStoreBase.enterpriseModel');

  @override
  EnterpriseModel? get enterpriseModel {
    _$enterpriseModelAtom.reportRead();
    return super.enterpriseModel;
  }

  @override
  set enterpriseModel(EnterpriseModel? value) {
    _$enterpriseModelAtom.reportWrite(value, super.enterpriseModel, () {
      super.enterpriseModel = value;
    });
  }

  final _$isLoadingEnterpriseAtom =
      Atom(name: '_EnterpriseStoreBase.isLoadingEnterprise');

  @override
  bool get isLoadingEnterprise {
    _$isLoadingEnterpriseAtom.reportRead();
    return super.isLoadingEnterprise;
  }

  @override
  set isLoadingEnterprise(bool value) {
    _$isLoadingEnterpriseAtom.reportWrite(value, super.isLoadingEnterprise, () {
      super.isLoadingEnterprise = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_EnterpriseStoreBase.search');

  @override
  Future<Either<EnterpriseException, EnterpriseModel>> search(
      {String? enterpriseName}) {
    return _$searchAsyncAction
        .run(() => super.search(enterpriseName: enterpriseName));
  }

  final _$_EnterpriseStoreBaseActionController =
      ActionController(name: '_EnterpriseStoreBase');

  @override
  void cleanData() {
    final _$actionInfo = _$_EnterpriseStoreBaseActionController.startAction(
        name: '_EnterpriseStoreBase.cleanData');
    try {
      return super.cleanData();
    } finally {
      _$_EnterpriseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enterpriseModel: ${enterpriseModel},
isLoadingEnterprise: ${isLoadingEnterprise}
    ''';
  }
}
