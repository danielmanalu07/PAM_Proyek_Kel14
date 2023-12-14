import 'package:cis/views/Admin/screens/loginadmin_screen.dart';
import 'package:cis/views/Mahasiswa/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/Logo_del.jpg',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),

            // Teks animasi
            AnimatedText(),

            SizedBox(height: 20),

            // Tombol "As Admin" dan "As Student"
            ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginAdmin());
                },
                child: Text('As Admin')),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: Text('As Student')),
          ],
        ),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  String welcomeText = '';
  String roleText = '';

  @override
  void initState() {
    super.initState();
    _animateText();
  }

  void _animateText() async {
    await _animateWelcomeText();
    await _animateRoleText();
  }

  Future<void> _animateWelcomeText() async {
    for (int i = 0; i < 'Welcome to ITDel App'.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        welcomeText = 'Welcome to ITDel App'.substring(0, i + 1);
      });
    }
  }

  Future<void> _animateRoleText() async {
    await Future.delayed(Duration(milliseconds: 500));
    for (int i = 0;
        i < 'You can access this app As Admin or As Student'.length;
        i++) {
      await Future.delayed(Duration(milliseconds: 50));
      setState(() {
        roleText = 'You can access this app As Admin or As Student'
            .substring(0, i + 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          welcomeText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          roleText,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
