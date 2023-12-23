import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/views/Mahasiswa/screens/surat_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BuatSuratPage extends StatefulWidget {
  const BuatSuratPage({super.key});

  @override
  State<BuatSuratPage> createState() => _BuatSuratPageState();
}

class _BuatSuratPageState extends State<BuatSuratPage> {
  final TextEditingController _tanggalpengambilan = TextEditingController();
  final TextEditingController _tujuan = TextEditingController();

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

  Future<void> submitSurat() async {
    try {
      String tanggalpengambilan = _tanggalpengambilan.text;
      String tujuan = _tujuan.text;

      final box = GetStorage();
      String authToken = box.read('token');

      var response = await http.post(
        Uri.parse(user + 'surat'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'Tujuan': tujuan,
          'TanggalPengambilan': tanggalpengambilan,
        }),
      );

      if (response.statusCode == 201) {
        print('Surat berhasil dibuat');
        Get.offAll(() => SuratPage());
      } else {
        print('Gagal membuat Surat. Status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Surat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tujuan,
              decoration: InputDecoration(labelText: 'Tujuan'),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () => _selectDateAndTime(context, _tanggalpengambilan),
              child: IgnorePointer(
                child: TextField(
                  controller: _tanggalpengambilan,
                  decoration: InputDecoration(labelText: 'Tanggal Pengambilan'),
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                submitSurat();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
