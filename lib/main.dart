import 'package:app_inspection/Screens/InspectionScreens/inspection_data.dart';
import 'package:app_inspection/Screens/InspectionScreens/overview.dart';
import 'package:app_inspection/Screens/home_screen.dart';
import 'package:app_inspection/utils/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = Get.put(SettingsController());
  await settingsController.loadSettings();
  runApp(
    ChangeNotifierProvider(
      create: (_) => InspectionData(selectedWheel: 'Wheel 1'),
      child: MyApp(settingsController: settingsController),
    ),
  );
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController;
  const MyApp({super.key, required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          locale: settingsController.locale.value,
          themeMode: settingsController.themeMode.value,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: lightColorScheme),
          darkTheme: ThemeData(colorScheme: darkColorScheme),
          //home: const LoginScreen(),
          home: const Overview(id: "1", username: "username"),
        ));
  }
}
