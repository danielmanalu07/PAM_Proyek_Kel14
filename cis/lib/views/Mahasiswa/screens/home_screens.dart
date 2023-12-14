import 'dart:convert';

import 'package:cis/constants/constants.dart';
import 'package:cis/controllers/Mahasiswa/MahasiswaController.dart';
import 'package:cis/fetchdata/mahasiswas.dart';
import 'package:cis/views/Mahasiswa/screens/izinkeluar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MahasiswaController _mahasiswaController =
      Get.put(MahasiswaController());
  MahasiswaData? userData;

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
    fetchDataMahasiswa();
  }

  Future<void> fetchDataMahasiswa() async {
    try {
      String? authToken = box.read('token');

      if (authToken == null) {
        throw Exception('Token not available');
      }

      final response = await http.get(Uri.parse(user + 'user'), headers: {
        'Authorization': 'Bearer $authToken',
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        setState(() {
          userData = MahasiswaData.fromJson(responseData['mahasiswa']);
        });
      } else {
        throw Exception(
            'Failed to load mahasiswa data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load mahasiswa data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              _mahasiswaController.logout();
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
              'Selamat Datang ${userData?.nama ?? 'Nama tidak tersedia'}',
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
              itemCount: 4,
              itemBuilder: (context, index) {
                List<Map<String, dynamic>> cardData = [
                  {
                    'title': 'Request Surat',
                    'icon': Icons.mail,
                    'color': Colors.blue,
                    'page': null,
                  },
                  {
                    'title': 'Izin Keluar',
                    'icon': Icons.directions_walk,
                    'color': Colors.green,
                    'page': IzinKeluarPage(),
                  },
                  {
                    'title': 'Izin Bermalam',
                    'icon': Icons.hotel,
                    'color': Colors.orange,
                    'page': null,
                  },
                  {
                    'title': 'Pembelian Kaos',
                    'icon': Icons.shopping_cart,
                    'color': Colors.purple,
                    'page': null,
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
              break;
            case 1:
              break;
            case 2:
              break;
          }
        },
      ),
    );
  }
}
