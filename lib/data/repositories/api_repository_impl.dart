import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/network_config.dart';
import '../../domain/models/data.dart';
import '../../domain/repositories/api_repository.dart';
import '../local/shared_preferences_service.dart';

class ApiRepositoryImpl implements ApiRepository {
  final SharedPreferencesService sharedPreferencesService;

  ApiRepositoryImpl(this.sharedPreferencesService);

  @override
  Future<List<Data>> fetchData() async {  // Cambia el tipo de retorno a List<Data>
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);  // Decodifica como una lista
      return jsonData.map((item) => Data.fromJson(item)).toList();  // Convierte cada elemento
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<void> saveDataLocally(List<Data> dataList) async {  // Cambia el tipo a List<Data>
    final dataJsonList = dataList.map((data) => data.toJson()).toList();
    sharedPreferencesService.saveDataList(dataJsonList);
  }
}
