import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/entities/enterprise.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/interfaces/enterprise_interface.dart';
import 'package:empresas_flutter/src/modules/enterprise/infra/datasources/enterprise_datasource.dart';

class EnterpriseRepository implements IEnterpriseRepository {
  final IEnterpriseDatasource? enterprisehDatasource;

  EnterpriseRepository({this.enterprisehDatasource});
  @override
  Future<Either<EnterpriseException, EnterpriseModel>> search(
      {String? enterpriseName}) async {
    try {
      final user = await enterprisehDatasource?.search(enterpriseName: enterpriseName!);

      return Right(user!);
    } on EnterpriseException catch (e) {
      return Left(e);
    } on Exception {
      return Left(EnterpriseException("Erro, verifique a conexão de internet"));
    }
  }
}
