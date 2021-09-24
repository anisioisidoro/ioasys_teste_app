import 'package:empresas_flutter/src/service/local_storage_service/local_storage_interface.dart';
import 'package:empresas_flutter/src/service/local_storage_service/local_storage_service.dart';

class Header {
  Future<Map<String, String>> readerToken() async {
    final ILocalStorage storage = LocalStorageService();

    var token = await storage.get(key: "token");
    var uid = await storage.get(key: "uid");
    var client = await storage.get(key: "client");

    return {
      "content-type": "application/json",
      "access-token": token,
      "uid": uid,
      "client": client
    };
  }
}
