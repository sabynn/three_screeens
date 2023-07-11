import 'package:flutter/material.dart';
import 'package:three_screeens/core/design/decoration/base_color.dart';
import 'package:three_screeens/feature/first/presentation/first_screen.dart';
import 'package:three_screeens/feature/second/presentation/second_screen.dart';
import 'package:three_screeens/feature/third/presentation/third_screen.dart';
import 'package:three_screeens/services/di.dart';
import 'package:three_screeens/services/shared_preferences.dart';

import 'core/constant/base_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Screens App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: BaseColors.primary),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
      routes: {
        BaseRoute.firstScreen: (context) => const FirstScreen(),
        BaseRoute.secondScreen: (context) => const SecondScreen(),
        BaseRoute.thirdScreen: (context) => const ThirdScreen(),
      },
    );
  }
}
