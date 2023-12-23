import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/fetchdata/ruangan.dart';
import 'package:cis/views/Admin/screens/add_ruangan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RuanganPage extends StatefulWidget {
  const RuanganPage({super.key});

  @override
  State<RuanganPage> createState() => _RuanganPageState();
}

class _RuanganPageState extends State<RuanganPage> {
  late List<Ruangan> ruanganList = [];
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    fetchRuanganData();
  }

  Future<void> fetchRuanganData() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(admin + 'ruangan'),
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
        throw Exception('Failed to load Ruangan data');
      }
    } catch (error) {
      throw Exception('Failed to load Ruangan data: $error');
    }
  }

  Future<void> editRuangan(Ruangan ruangan) async {
    TextEditingController controller = TextEditingController();
    controller.text = ruangan.namaRuangan;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Ruangan'),
          content: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Nama Ruangan'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await updateRuangan(ruangan.id, controller.text);
                await fetchRuanganData();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> updateRuangan(int ruanganId, String newNamaRuangan) async {
    try {
      String? authToken = box.read('token');
      var response = await http.put(
        Uri.parse(admin + 'editruangan/$ruanganId'),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'Ruangan': newNamaRuangan}),
      );

      if (response.statusCode == 200) {
        var updatedRuangan =
            Ruangan(id: ruanganId, namaRuangan: newNamaRuangan);
        setState(() {
          ruanganList = ruanganList.map((ruangan) {
            if (ruangan.id == updatedRuangan.id) {
              return updatedRuangan;
            }
            return ruangan;
          }).toList();
        });
      } else {
        throw Exception('Failed to update Ruangan');
      }
    } catch (error) {
      print('Error in updateRuangan: $error');
      throw Exception('Failed to update Ruangan: $error');
    }
  }

  Future<void> deleteRuangan(int ruanganId) async {
    try {
      String? authToken = box.read('token');
      var response = await http.delete(
        Uri.parse(admin + 'deleteruangan/$ruanganId'),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          ruanganList.removeWhere((ruangan) => ruangan.id == ruanganId);
        });
      } else {
        throw Exception('Failed to delete Ruangan');
      }
    } catch (error) {
      print('Error in deleteRuangan: $error');
      throw Exception('Failed to delete Ruangan: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Row(
          children: [
            Text(
              'Kelola Ruangan',
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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() => AddRuangan());
                },
                child: Text('Add'),
              ),
            ],
          ),
          Expanded(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Ruangan')),
                DataColumn(label: Text('Actions')),
              ],
              rows: ruanganList
                  .map(
                    (ruangan) => DataRow(
                      cells: [
                        DataCell(Text('${ruangan.namaRuangan}')),
                        DataCell(Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                editRuangan(ruangan);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                deleteRuangan(ruangan.id);
                              },
                            ),
                          ],
                        )),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
