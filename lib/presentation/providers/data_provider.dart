import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/data.dart';
import '../../domain/repositories/api_repository.dart';
import '../../core/providers.dart';

final dataProvider = StateNotifierProvider<DataNotifier, AsyncValue<List<Data>>>((ref) {
  final apiRepository = ref.watch(apiRepositoryProvider);
  return DataNotifier(apiRepository);
});

class DataNotifier extends StateNotifier<AsyncValue<List<Data>>> {
  final ApiRepository apiRepository;

  DataNotifier(this.apiRepository) : super(const AsyncValue.loading()) {
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final dataList = await apiRepository.fetchData();
      state = AsyncValue.data(dataList);
      await apiRepository.saveDataLocally(dataList);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
