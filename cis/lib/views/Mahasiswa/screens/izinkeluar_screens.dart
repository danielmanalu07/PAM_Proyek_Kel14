import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/fetchdata/izinkeluar.dart';
import 'package:cis/views/Mahasiswa/screens/buatik_screen.dart';
import 'package:cis/views/Mahasiswa/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class IzinKeluarPage extends StatefulWidget {
  const IzinKeluarPage({super.key});

  @override
  State<IzinKeluarPage> createState() => _IzinKeluarPageState();
}

class _IzinKeluarPageState extends State<IzinKeluarPage> {
  List<IzinKeluar> izinKeluars = [];

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    fetchDataIzinKeluar();
  }

  Future<void> fetchDataIzinKeluar() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse('${user}izin-keluars'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          izinKeluars = data.map((item) => IzinKeluar.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load izin keluar data');
      }
    } catch (error) {
      throw Exception('Failed to load izin keluar data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Izin Keluar Page'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() => BuatIKPage());
                },
                child: Text('Buat Izin'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 180),
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
                  DataColumn(label: Text('Rencana Berangkat')),
                  DataColumn(label: Text('Rencana Kembali')),
                  DataColumn(label: Text('Keperluan')),
                  DataColumn(label: Text('Status')),
                ],
                rows: izinKeluars.map((izin) {
                  return DataRow(
                    cells: [
                      DataCell(Text(izin.rencanaBerangkat)),
                      DataCell(Text(izin.rencanaKembali)),
                      DataCell(Text(izin.keperluan)),
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
