import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/data.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  Future<void> saveDataList(List<Map<String, dynamic>> dataList) async {
    _prefs.setString('data', jsonEncode(dataList));
  }

  List<Data>? getDataList() {
    final dataJson = _prefs.getString('data');
    if (dataJson != null) {
      final List<dynamic> jsonData = jsonDecode(dataJson);
      return jsonData.map((item) => Data.fromJson(item)).toList();
    }
    return null;
  }
}
