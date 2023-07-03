import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/feature_home/presentation/screen/home_page.dart';
import 'locator.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        canvasColor: const Color(0xffdceeff),
      ),
      home: MyHomePage(),
    );
  }
}
