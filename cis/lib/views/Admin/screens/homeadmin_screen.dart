import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/controllers/Admin/AdminController.dart';
import 'package:cis/fetchdata/admin.dart';
import 'package:cis/views/Admin/screens/approve_ib.dart';
import 'package:cis/views/Admin/screens/approve_ik.dart';
import 'package:cis/views/Admin/screens/approve_ruangan_screen.dart';
import 'package:cis/views/Admin/screens/approve_surat.dart';
import 'package:cis/views/Admin/screens/kaos_screen.dart';
import 'package:cis/views/Admin/screens/list_ruangan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final AdminController _adminController = Get.put(AdminController());
  AdminData? userData;

  final box = GetStorage();
  void _showCardDetails(String cardTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$cardTitle tapped'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchDataAdmin();
  }

  Future<void> fetchDataAdmin() async {
    try {
      String? authToken = box.read('token');

      if (authToken == null) {
        throw Exception('Token not available');
      }

      final response = await http.get(Uri.parse(admin + 'user'), headers: {
        'Authorization': 'Bearer $authToken',
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        setState(() {
          userData = AdminData.fromJson(responseData['admin']);
        });
      } else {
        throw Exception('Failed to load admin data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load admin data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Admin Home'),
        actions: [
          IconButton(
            onPressed: () {
              _adminController.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selamat Datang ${userData?.username ?? 'Nama Tidak Tersedia'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                List<Map<String, dynamic>> cardData = [
                  {
                    'title': 'Approve Surat',
                    'icon': Icons.email,
                    'color': Colors.blue,
                    'page': ApproveSurat(),
                  },
                  {
                    'title': 'Izin Keluar Mahasiswa',
                    'icon': Icons.directions_walk,
                    'color': Colors.green,
                    'page': ApproveIKPage(),
                  },
                  {
                    'title': 'Izin Bermalam Mahasiswa',
                    'icon': Icons.hotel,
                    'color': Colors.orange,
                    'page': ApproveIB(),
                  },
                  {
                    'title': 'Penjualan Kaos',
                    'icon': Icons.shopping_cart,
                    'color': Colors.purple,
                    'page': KaosPage(),
                  },
                  {
                    'title': 'Ruangan Kelas',
                    'icon': Icons.window_outlined,
                    'color': Colors.grey,
                    'page': RuanganPage(),
                  },
                  {
                    'title': 'Request Ruangan',
                    'icon': Icons.door_back_door,
                    'color': Colors.redAccent,
                    'page': ApproveRuangan(),
                  },
                ];
                return GestureDetector(
                  onTap: () {
                    if (cardData[index]['page'] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => cardData[index]['page'],
                        ),
                      );
                    } else {
                      _showCardDetails(cardData[index]['title']);
                    }
                  },
                  child: Card(
                    color: cardData[index]['color'],
                    child: InkWell(
                      onTap: () {
                        if (cardData[index]['page'] == null) {
                          _showCardDetails(cardData[index]['title']);
                        } else {
                          Get.to(cardData[index]['page']);
                        }
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              cardData[index]['icon'],
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(height: 10),
                            Text(
                              cardData[index]['title'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.blue,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              // Implement admin home navigation logic
              break;
            case 1:
              // Implement admin history navigation logic
              break;
            case 2:
              // Implement admin account navigation logic
              break;
          }
        },
      ),
    );
  }
}
