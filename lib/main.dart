import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/homepage.dart';
import 'utils/translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('el', 'EL'),
      translations: LocaleString(),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Tour de Recipe',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}
