import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/entities/enterprise.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/errors/errors.dart';


abstract class IEnterpriseRepository {
  Future<Either<EnterpriseException, EnterpriseModel>> search(
      {String enterpriseName});
}
