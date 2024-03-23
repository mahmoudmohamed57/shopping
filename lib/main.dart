import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoply/firebase_options.dart';
import 'package:shoply/logic/controllers/theme_controller.dart';
import 'package:shoply/utils/routes_manager.dart';
import 'package:shoply/utils/storage_manager.dart';
import 'package:shoply/utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppStorage _appStorage = AppStorage(GetStorage());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              _appStorage.getUserFromBox() == true
          ? Routes.mainRoute
          : Routes.onBoardingRoute,
      getPages: AppRoutes.routes,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
    );
  }
}
