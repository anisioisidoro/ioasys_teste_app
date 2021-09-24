import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/entities/enterprise.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/interfaces/enterprise_interface.dart';
import 'package:validators/validators.dart';

abstract class IEnterpriseUseCase {
  Future<Either<EnterpriseException, EnterpriseModel>> search(
      {String enterpriseName});
}

class EnterpriseUseCase implements IEnterpriseUseCase {
  final IEnterpriseRepository? repository;

  EnterpriseUseCase({this.repository});

  @override
  Future<Either<EnterpriseException, EnterpriseModel>> search(
      {String? enterpriseName}) async {
    if (isNull(enterpriseName)) {
      return Left(EnterpriseException("Nome da empresa invalido"));
    }

    return await repository!.search(enterpriseName: enterpriseName!);
  }
}
