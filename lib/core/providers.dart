import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repositories/api_repository_impl.dart';
import '../domain/repositories/api_repository.dart';
import '../data/local/shared_preferences_service.dart';



final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final apiRepositoryProvider = Provider<ApiRepository>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final sharedPreferencesService = SharedPreferencesService(sharedPreferences);
  return ApiRepositoryImpl(sharedPreferencesService);
});
