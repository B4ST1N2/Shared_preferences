import '../models/data.dart';

abstract class ApiRepository {
  Future<List<Data>> fetchData();  // Cambia a Future<List<Data>>
  Future<void> saveDataLocally(List<Data> dataList);  // Cambia el tipo a List<Data>
}
