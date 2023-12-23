import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/views/Mahasiswa/screens/izinbermalam_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BuatIBPage extends StatefulWidget {
  const BuatIBPage({super.key});

  @override
  State<BuatIBPage> createState() => _BuatIBPageState();
}

class _BuatIBPageState extends State<BuatIBPage> {
  final TextEditingController _rencanaBerangkatController =
      TextEditingController();
  final TextEditingController _rencanaKembaliController =
      TextEditingController();
  final TextEditingController _keperluanController = TextEditingController();
  final TextEditingController _tujuanController = TextEditingController();
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
          controller.text = "${selectedDateTime.toLocal()}".split('.')[0];
        });
      }
    }
  }

  Future<void> submitIzinBermalam() async {
    try {
      String rencanaBerangkat = _rencanaBerangkatController.text;
      String rencanaKembali = _rencanaKembaliController.text;
      String keperluan = _keperluanController.text;
      String tujuan = _tujuanController.text;

      DateTime selectedDateTime = DateTime.parse(rencanaBerangkat);
      if (!_isValidSubmissionTime(selectedDateTime)) {
        _showCancelSnackbar();
        return;
      }

      final box = GetStorage();
      String authToken = box.read('token');

      var response = await http.post(
        Uri.parse(user + 'ib'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'RencanaBerangkat': rencanaBerangkat,
          'RencanaKembali': rencanaKembali,
          'Keperluan': keperluan,
          'Tujuan': tujuan,
        }),
      );

      if (response.statusCode == 201) {
        print('Izin Bermalam berhasil dibuat');
        Get.offAll(() => IzinBermalamPage());
      } else {
        print('Gagal membuat izin Beralam. Status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  bool _isValidSubmissionTime(DateTime selectedDateTime) {
    if (selectedDateTime.weekday == DateTime.friday &&
        selectedDateTime.hour >= 17) {
      return true;
    } else if (selectedDateTime.weekday == DateTime.saturday &&
        selectedDateTime.hour >= 8 &&
        selectedDateTime.hour <= 17) {
      return true;
    } else {
      return false;
    }
  }

  void _showCancelSnackbar() {
    Get.snackbar(
      'Pemberitahuan!!!',
      'Pengajuan izin bermalam tidak bisa dilakukan sebelum jam 17.00 pada hari jumat',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Izin Bermalam'),
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
            TextField(
              controller: _tujuanController,
              decoration: InputDecoration(labelText: 'Tujuan'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                submitIzinBermalam();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
