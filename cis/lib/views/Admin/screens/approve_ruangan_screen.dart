import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/fetchdata/bookingruangan.dart';
import 'package:cis/fetchdata/mahasiswas.dart';
import 'package:cis/fetchdata/ruangan.dart';
import 'package:cis/views/Admin/screens/homeadmin_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApproveRuangan extends StatefulWidget {
  const ApproveRuangan({super.key});

  @override
  State<ApproveRuangan> createState() => _ApproveRuanganState();
}

class _ApproveRuanganState extends State<ApproveRuangan> {
  List<BookingRuangan> bookingRuangan = [];
  List<MahasiswaData> mahasiswaData = [];
  List<Ruangan> ruanganList = [];

  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    getDataBookingRuangan();
    getDataMahasiswa();
    fetchRuanganData();
  }

  Future<void> fetchRuanganData() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(admin + 'getRuangan'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          ruanganList = data.map((item) => Ruangan.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load Ruangan data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load Ruangan data: $error');
    }
  }

  Future<void> getDataBookingRuangan() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(admin + 'getbr'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          bookingRuangan =
              data.map((item) => BookingRuangan.fromJson(item)).toList();
        });
      } else {
        throw Exception(
            'Failed to load booking ruangan data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load booking ruangan data: $e');
    }
  }

  Future<void> getDataMahasiswa() async {
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

      var response = await http.put(
        Uri.parse(admin + 'br/$id'),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'status': status}),
      );

      print('Response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200) {
        getDataBookingRuangan();
      } else {
        throw Exception('Failed to update status');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to update status: $error');
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
              'Approve Request Ruangans',
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
                  DataColumn(label: Text('Ruangan')),
                  DataColumn(label: Text('Tanggal Mulai')),
                  DataColumn(label: Text('Tanggal Berakhir')),
                  DataColumn(label: Text('Keperluan')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: bookingRuangan.map((br) {
                  var mahasiswa = mahasiswaData.firstWhereOrNull(
                    (m) => m.id?.toString() == br.mahasiswaId.toString(),
                  );
                  var ruangan = ruanganList.firstWhereOrNull(
                    (r) => r.id.toString() == br.ruanganId.toString(),
                  );

                  return DataRow(
                    cells: [
                      DataCell(Text(mahasiswa?.nama ?? 'Unknown')),
                      DataCell(Text(ruangan?.namaRuangan ?? 'Unknown')),
                      DataCell(Text(br.rencanaMulai)),
                      DataCell(Text(br.rencanaBerakhir)),
                      DataCell(Text(br.keperluan)),
                      DataCell(Text(getStatusText(br.status))),
                      DataCell(Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              updateStatus(br.id, 1);
                            },
                            child: Text('Setuju'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              updateStatus(br.id, 2);
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
