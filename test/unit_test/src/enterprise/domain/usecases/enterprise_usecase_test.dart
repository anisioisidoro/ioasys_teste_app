import 'package:dartz/dartz.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/entities/enterprise.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/errors/errors.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/interfaces/enterprise_interface.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/usecases/enterprise_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class EnterpriseRepositoryMock extends Mock  implements IEnterpriseRepository {
  Future<Either<EnterpriseException, EnterpriseModel>> search({String? enterpriseName}) async{
    return Right(EnterpriseModel(
      enterprises: [
       Enterprise(
         description: "description",
         id: 1,
         enterpriseName: "Portana"
       )
      ]
    ));
  }
}
void main() {
   final repository = EnterpriseRepositoryMock();
  final usecase = EnterpriseUseCase(repository: repository);
  test('should return enterprise', () async {
      final result = await usecase.search(enterpriseName: "portana");

    expect(result.isRight(), true);

    expect(result.getOrElse(() => EnterpriseModel()).enterprises?.length, isNonZero);
  });

  test('should give error when enterprise name is invalid', () async {

    final result = await usecase.search(enterpriseName: "");

    expect(result.isLeft(), true);
  });
}