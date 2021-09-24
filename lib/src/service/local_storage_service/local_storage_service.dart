import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage_interface.dart';

class LocalStorageService implements ILocalStorage {
  @override
  Future get({String? key}) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key!);
  }

  @override
  Future put({String? key, String? value}) async {
    var shared = await SharedPreferences.getInstance();
    shared.setString(key!, value!);
  }
}