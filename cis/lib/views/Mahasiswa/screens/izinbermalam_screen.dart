import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/fetchdata/izinbermalam.dart';
import 'package:cis/views/Mahasiswa/screens/buatib_screen.dart';
import 'package:cis/views/Mahasiswa/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class IzinBermalamPage extends StatefulWidget {
  const IzinBermalamPage({super.key});

  @override
  State<IzinBermalamPage> createState() => _IzinBermalamPageState();
}

class _IzinBermalamPageState extends State<IzinBermalamPage> {
  List<IzinBermalam> izinbermalam = [];

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    fetchdataIzinBermalam();
  }

  Future<void> fetchdataIzinBermalam() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(user + 'ib'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          izinbermalam =
              data.map((item) => IzinBermalam.fromJson(item)).toList();
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
        title: Text('Izin Bermalam Page'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() => BuatIBPage());
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
                rows: izinbermalam.map((izin) {
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
