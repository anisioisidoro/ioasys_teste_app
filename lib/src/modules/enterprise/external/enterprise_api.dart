import 'dart:convert';
import 'package:empresas_flutter/src/global_const.dart';
import 'package:empresas_flutter/src/modules/enterprise/domain/entities/enterprise.dart';
import 'package:empresas_flutter/src/modules/enterprise/infra/datasources/enterprise_datasource.dart';
import 'package:empresas_flutter/src/modules/enterprise/infra/headers/headers.dart';
import 'package:http/http.dart' as http;

class EnterpriseApi implements IEnterpriseDatasource {
  @override
  Future<EnterpriseModel> search({String? enterpriseName}) async {

    Header _header = Header();
    var header = await _header.readerToken();
    var response = await http.get(
     Uri.parse( API_URL + "enterprises?enterprise_types=2&name=$enterpriseName"),
      headers: header
    );

    return EnterpriseModel.fromJson(json.decode(response.body));
  }
}
