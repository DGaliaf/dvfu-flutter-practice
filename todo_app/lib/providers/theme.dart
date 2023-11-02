import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
    primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
    textTheme: Typography(platform: TargetPlatform.iOS).white,
    useMaterial3: true,
  );
}

// theme: ThemeData(
            // scaffoldBackgroundColor: Colors.black,
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            // primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
            // textTheme: Typography(platform: TargetPlatform.iOS).white,
            // useMaterial3: true,
          // ),