import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/fetchdata/surat.dart';
import 'package:cis/views/Mahasiswa/screens/buatsurat_screen.dart';
import 'package:cis/views/Mahasiswa/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SuratPage extends StatefulWidget {
  const SuratPage({super.key});

  @override
  State<SuratPage> createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  List<Surat> surat = [];

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    fetchDataSurat();
  }

  Future<void> fetchDataSurat() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(user + 'surat'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          surat = data.map((item) => Surat.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load Surat data');
      }
    } catch (error) {
      throw Exception('Failed to load Surat data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Surat Page'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() => BuatSuratPage());
                },
                child: Text('Request Surat'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 140),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => HomePage());
                  },
                  child: Text('Kembali'),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 16.0,
                columns: [
                  DataColumn(label: Text('Tujuan')),
                  DataColumn(label: Text('Tanggal Pengambilan')),
                  DataColumn(label: Text('Status')),
                ],
                rows: surat.map((izin) {
                  return DataRow(
                    cells: [
                      DataCell(Text(izin.Tujuan)),
                      DataCell(Text(izin.TanggalPengambilan)),
                      DataCell(Text(getStatusText(izin.status))),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getStatusText(int status) {
    switch (status) {
      case 0:
        return 'Pending';
      case 1:
        return 'Disetujui';
      case 2:
        return 'Ditolak';
      default:
        return 'Unknown';
    }
  }
}
