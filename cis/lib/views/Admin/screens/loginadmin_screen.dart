import 'package:cis/controllers/Admin/AdminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AdminController _adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/Logo_del.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Institut Teknologi Del',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  controller: _passwordController,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _adminController.login(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                    await Future.delayed(const Duration(seconds: 3));
                    _adminController.isLoading.value = false;
                  },
                  child: Obx(
                    () {
                      return _adminController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 10,
                              ),
                            )
                          : Text('Login');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
