import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/fetchdata/bookingruangan.dart';
import 'package:cis/fetchdata/ruangan.dart';
import 'package:cis/views/Mahasiswa/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:date_time_picker/date_time_picker.dart';

class BookingRuanganPage extends StatefulWidget {
  const BookingRuanganPage({Key? key}) : super(key: key);

  @override
  State<BookingRuanganPage> createState() => _BookingRuanganPageState();
}

class _BookingRuanganPageState extends State<BookingRuanganPage> {
  List<BookingRuangan> bookingRuangan = [];
  List<Ruangan> ruanganList = [];
  late TextEditingController tanggalMulaiController = TextEditingController();
  late TextEditingController tanggalBerakhirController =
      TextEditingController();
  late TextEditingController keperluanController = TextEditingController();

  Ruangan? selectedRuangan;
  DateTime? _selectedDate;

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    fetchdataBookingRuangan();
    fetchRuanganData();
  }

  Future<void> fetchdataBookingRuangan() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(user + 'br'),
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

  Future<void> fetchRuanganData() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(user + 'getRuangan'),
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

  Future<void> submitBooking() async {
    try {
      String keperluan = keperluanController.text;
      String ruanganId = selectedRuangan!.id.toString();

      final box = GetStorage();
      String authToken = box.read('token');

      var response = await http.post(
        Uri.parse(user + 'br'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'ruangan_id': ruanganId, // Include the ruangan_id in the request
          'Keperluan': keperluan,
          'RencanaMulai': _selectedDate!.toIso8601String(),
          'RencanaBerakhir': _selectedDate!
              .toIso8601String(), // Assuming an hour duration for simplicity
        }),
      );

      if (response.statusCode == 201) {
        print('Booking ruangan berhasil dibuat');
        fetchdataBookingRuangan();
      } else {
        print('Gagal membuat Booking ruangan. Status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void showRequestRuanganDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request Ruangan'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () =>
                        _selectDateAndTime(context, tanggalMulaiController),
                    child: IgnorePointer(
                      child: TextField(
                        controller: tanggalMulaiController,
                        decoration:
                            InputDecoration(labelText: 'Tanggal Mulai & Waktu'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () =>
                        _selectDateAndTime(context, tanggalBerakhirController),
                    child: IgnorePointer(
                      child: TextField(
                        controller: tanggalBerakhirController,
                        decoration: InputDecoration(
                            labelText: 'Tanggal Berakhir & Waktu'),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: keperluanController,
                    decoration: InputDecoration(labelText: 'Keperluan'),
                    // Add any validation or formatting as needed
                  ),
                  DropdownButton<Ruangan>(
                    value: selectedRuangan,
                    onChanged: (Ruangan? newValue) {
                      setState(() {
                        selectedRuangan = newValue;
                      });
                    },
                    items: ruanganList.map((Ruangan ruangan) {
                      return DropdownMenuItem<Ruangan>(
                        value: ruangan,
                        child: Text(ruangan.namaRuangan),
                      );
                    }).toList(),
                    hint: Text('Pilih Ruangan'),
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                submitBooking();
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Booking Ruangan"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  showRequestRuanganDialog();
                },
                child: Text('Request Ruangan'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 120),
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
                  DataColumn(label: Text('Ruangan')),
                  DataColumn(label: Text('Rencana Mulai')),
                  DataColumn(label: Text('Rencana Berakhir')),
                  DataColumn(label: Text('Keperluan')),
                  DataColumn(label: Text('Status')),
                ],
                rows: bookingRuangan.map((br) {
                  var ruangan = ruanganList.firstWhereOrNull(
                    (r) => r.id.toString() == br.ruanganId.toString(),
                  );
                  return DataRow(
                    cells: [
                      DataCell(Text(ruangan?.namaRuangan ?? 'Unknown')),
                      DataCell(Text(br.rencanaMulai)),
                      DataCell(Text(br.rencanaBerakhir)),
                      DataCell(Text(br.keperluan)),
                      DataCell(Text(getStatusText(br.status))),
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
