import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/views/Admin/screens/homeadmin_screen.dart';
import 'package:cis/views/Admin/screens/loginadmin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AdminController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var mahasiswa = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(admin + 'login'),
        headers: {
          'Accept': 'application/json',
        },
        body: mahasiswa,
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const HomeAdmin());
        Get.snackbar(
          'Success',
          jsonDecode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        print("Success :  ${response.statusCode}");
        print(response.body);
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          jsonDecode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print("Error :  ${response.statusCode}");
        print(response.body);
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  void logout() {
    box.remove('token');
    Get.offAll(() => LoginAdmin());
  }
}
