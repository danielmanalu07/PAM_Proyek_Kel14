import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/views/Mahasiswa/screens/izinkeluar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BuatIKPage extends StatefulWidget {
  const BuatIKPage({Key? key}) : super(key: key);

  @override
  _BuatIKPageState createState() => _BuatIKPageState();
}

class _BuatIKPageState extends State<BuatIKPage> {
  final TextEditingController _rencanaBerangkatController =
      TextEditingController();
  final TextEditingController _rencanaKembaliController =
      TextEditingController();
  final TextEditingController _keperluanController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDateAndTime(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _selectedDate = selectedDateTime;
          controller.text = "${selectedDateTime.toLocal()}".split(' ')[0] +
              ' ${selectedDateTime.toLocal().hour}:${selectedDateTime.toLocal().minute}';
        });
      }
    }
  }

  Future<void> submitIzinKeluar() async {
    try {
      String rencanaBerangkat = _rencanaBerangkatController.text;
      String rencanaKembali = _rencanaKembaliController.text;
      String keperluan = _keperluanController.text;

      final box = GetStorage();
      String authToken = box.read('token');

      var response = await http.post(
        Uri.parse(user + 'izin-keluars'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'RencanaBerangkat': rencanaBerangkat,
          'RencanaKembali': rencanaKembali,
          'Keperluan': keperluan,
        }),
      );

      if (response.statusCode == 201) {
        print('Izin keluar berhasil dibuat');
        Get.offAll(() => IzinKeluarPage());
      } else {
        print('Gagal membuat izin keluar. Status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Izin Keluar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () =>
                  _selectDateAndTime(context, _rencanaBerangkatController),
              child: IgnorePointer(
                child: TextField(
                  controller: _rencanaBerangkatController,
                  decoration:
                      InputDecoration(labelText: 'Tanggal Berangkat & Waktu'),
                ),
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () =>
                  _selectDateAndTime(context, _rencanaKembaliController),
              child: IgnorePointer(
                child: TextField(
                  controller: _rencanaKembaliController,
                  decoration:
                      InputDecoration(labelText: 'Tanggal Kembali & Waktu'),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _keperluanController,
              decoration: InputDecoration(labelText: 'Keperluan'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                submitIzinKeluar();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
