import 'package:cis/controllers/Mahasiswa/MahasiswaController.dart';
import 'package:cis/views/Mahasiswa/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _ktpController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final MahasiswaController _mahasiswaController =
      Get.put(MahasiswaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _ktpController,
                decoration: InputDecoration(labelText: 'ktp'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nimController,
                decoration: InputDecoration(labelText: 'nim'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nohpController,
                decoration: InputDecoration(labelText: 'nohp'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordConfirmationController,
                decoration: InputDecoration(labelText: 'Password_Confirmation'),
                obscureText: true,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  await _mahasiswaController.register(
                    ktp: _ktpController.text.trim(),
                    nim: _nimController.text.trim(),
                    nama: _nameController.text.trim(),
                    nohp: _nohpController.text.trim(),
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                    password_confirmation:
                        _passwordConfirmationController.text.trim(),
                  );
                  await Future.delayed(const Duration(seconds: 3));
                  _mahasiswaController.isLoading.value = false;
                },
                child: Obx(
                  () {
                    return _mahasiswaController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 10,
                            ),
                          )
                        : Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah Punya Akun? "),
                  TextButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text('login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
