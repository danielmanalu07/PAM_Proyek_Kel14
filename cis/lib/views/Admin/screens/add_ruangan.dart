import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/views/Admin/screens/list_ruangan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddRuangan extends StatefulWidget {
  const AddRuangan({super.key});

  @override
  State<AddRuangan> createState() => _AddRuanganState();
}

class _AddRuanganState extends State<AddRuangan> {
  final TextEditingController _ruanganController = TextEditingController();

  Future<void> submitRuangan() async {
    try {
      String ruangan = _ruanganController.text;

      final box = GetStorage();
      String authToken = box.read('token');

      var response = await http.post(
        Uri.parse(admin + 'addruangan'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'Ruangan': ruangan,
        }),
      );

      if (response.statusCode == 201) {
        print('Ruangan berhasil dibuat');
        Get.offAll(() => RuanganPage());
      } else {
        print('Gagal membuat Ruangan. Status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Ruangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _ruanganController,
              decoration: const InputDecoration(labelText: 'Nama Ruangan'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                submitRuangan();
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
