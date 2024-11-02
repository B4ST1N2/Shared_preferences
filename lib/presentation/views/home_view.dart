import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/data_provider.dart';
import '../widgets/data_display_widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsyncValue = ref.watch(dataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Data View')),
      body: dataAsyncValue.when(
        data: (dataList) => ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return DataDisplayWidget(data: dataList[index]);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
