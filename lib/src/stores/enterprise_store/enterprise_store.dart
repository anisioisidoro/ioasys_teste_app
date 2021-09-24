import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/entities/enterprise.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/usecases/enterprise_usecase.dart';
import 'package:mobx/mobx.dart';
part 'enterprise_store.g.dart';

class EnterpriseStore = _EnterpriseStoreBase with _$EnterpriseStore;

abstract class _EnterpriseStoreBase with Store {
  final IEnterpriseUseCase? repository;

  _EnterpriseStoreBase({this.repository});

  @observable
  EnterpriseModel? enterpriseModel;

  @observable
  bool isLoadingEnterprise = false;

  @action
  Future<Either<EnterpriseException, EnterpriseModel>> search({String? enterpriseName}) async {
    try {
      isLoadingEnterprise = true;

      var result = await repository?.search(enterpriseName: enterpriseName!);

      //get the data coming from the api, the l is to get the data on the left side, in this case the errors
      //the r is to get the data on the right side, when the request was successful
     return result!.fold((l) => Left(l), (r) => Right(enterpriseModel = r));

    } finally {
      isLoadingEnterprise = false;
    }
  }


//method to clear class data
  @action
  void cleanData() {
    enterpriseModel = EnterpriseModel(enterprises: []);
  }
}
