import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/fetchdata/izinbermalam.dart';
import 'package:cis/fetchdata/mahasiswas.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApproveIB extends StatefulWidget {
  const ApproveIB({super.key});

  @override
  State<ApproveIB> createState() => _ApproveIBState();
}

class _ApproveIBState extends State<ApproveIB> {
  List<IzinBermalam> izinBermalam = [];
  List<MahasiswaData> mahasiswaData = [];
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    fetchDataIzinBermalam();
    fetchDataMahasiswa();
  }

  Future<void> fetchDataMahasiswa() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(admin + 'getmhs'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        setState(() {
          mahasiswaData =
              responseData.map((item) => MahasiswaData.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load mahasiswa data');
      }
    } catch (error) {
      throw Exception('Failed to load mahasiswa data: $error');
    }
  }

  Future<void> updateStatus(int id, int status) async {
    try {
      String? authToken = box.read('token');
      print('Authorization Token: $authToken');

      var response = await http.put(
        Uri.parse(admin + 'ib/$id'),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'status': status}),
      );

      print('Response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        fetchDataIzinBermalam();
      } else {
        throw Exception('Failed to update status');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to update status: $error');
    }
  }

  Future<void> fetchDataIzinBermalam() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(admin + 'getib'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          izinBermalam =
              data.map((item) => IzinBermalam.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load izin bermalam data');
      }
    } catch (error) {
      throw Exception('Failed to load izin bermalam data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'Izin Bermalam Page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                FontAwesomeIcons.arrowRightFromBracket,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 16.0,
                columns: [
                  DataColumn(label: Text('Mahasiswa')),
                  DataColumn(label: Text('Rencana Berangkat')),
                  DataColumn(label: Text('Rencana Kembali')),
                  DataColumn(label: Text('Keperluan')),
                  DataColumn(label: Text('Tujuan')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: izinBermalam.map((izin) {
                  var mahasiswa = mahasiswaData.firstWhereOrNull(
                    (m) => m.id?.toString() == izin.mahasiswaId.toString(),
                  );

                  print('izin.mahasiswaId: ${izin.mahasiswaId}');
                  print('mahasiswa.id: ${mahasiswa?.id}');

                  return DataRow(
                    cells: [
                      DataCell(Text(mahasiswa?.nama ?? 'Unknown')),
                      DataCell(Text(izin.rencanaBerangkat)),
                      DataCell(Text(izin.rencanaKembali)),
                      DataCell(Text(izin.keperluan)),
                      DataCell(Text(izin.tujuan)),
                      DataCell(Text(getStatusText(izin.status))),
                      DataCell(Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              updateStatus(izin.id, 1);
                            },
                            child: Text('Setuju'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              updateStatus(izin.id, 2);
                            },
                            child: Text('Tolak'),
                          ),
                        ],
                      )),
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
