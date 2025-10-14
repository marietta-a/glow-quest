import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:glow_quest/core/game_configurations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static bool isNewUser = true;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: gamePages,
      initialRoute: '/home',
      title: 'Glow Up Journey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}