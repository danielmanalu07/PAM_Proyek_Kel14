// import 'dart:convert';

// import 'package:cis/constants/constants.dart';
// import 'package:cis/fetchdata/izinkeluar.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class IzinKeluarProvider extends ChangeNotifier {
//   List<IzinKeluar> izinKeluars = [];

//   Future<void> fetchData() async {
//     final response = await http.get(
//       Uri.parse(user + 'izin-keluars'),
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       izinKeluars = data.map((item) => IzinKeluar.fromJson(item)).toList();
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
