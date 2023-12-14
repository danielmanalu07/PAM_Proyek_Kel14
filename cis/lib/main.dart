import 'package:cis/views/Admin/screens/loginadmin_screen.dart';
import 'package:cis/views/Mahasiswa/screens/login_screens.dart';
import 'package:cis/views/splash_screen.dart';
// import 'package:cis/views/Mahasiswa/screens/login_screens.dart';
// import 'package:cis/views/Mahasiswa/screens/register_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
