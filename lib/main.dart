import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/routes/app_routes.dart';
import 'core/utils/app_string.dart';
import 'core/utils/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.fadeIn,
    );
  }
}
