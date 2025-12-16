import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_events/bindings/app_bindings.dart';
import 'package:my_events/routes/app_pages.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of MyEvents application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyEvents',
      themeMode: ThemeMode.light,
      theme: FkAppTheme.lightTheme,
      darkTheme: FkAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      initialBinding: AppBindings(),
      getPages: AppPages.pages,
    );
  }
}
