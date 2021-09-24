import 'package:empresas_flutter/src/modules/enterprise/domain/entities/enterprise.dart';

abstract class IEnterpriseDatasource {
  Future<EnterpriseModel> search({String enterpriseName});
}
