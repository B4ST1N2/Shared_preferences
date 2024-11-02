import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/views/home_view.dart';
import 'core/providers.dart';
import 'data/local/shared_preferences_service.dart';
import 'data/repositories/api_repository_impl.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        apiRepositoryProvider.overrideWithValue(ApiRepositoryImpl(
          SharedPreferencesService(sharedPreferences),
        )),
      ],
      child: MyApp(), // Elimina 'const' si está aquí
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modular App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeView(),
    );
  }
}
