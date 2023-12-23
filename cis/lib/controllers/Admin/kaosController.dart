import 'dart:convert';
import 'dart:io';

import 'package:cis/constants/constants.dart';
import 'package:cis/fetchdata/kaos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class KaosController extends GetxController {
  final box = GetStorage();
  List<Kaos> kaosList = [];
  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController gambarControllers = TextEditingController();

  File? _selectedImage;
  final ImagePicker gambarController = ImagePicker();

  void setSelectedImage(File? image) {
    _selectedImage = image;
  }

  @override
  void onInit() {
    super.onInit();
    fetchKaosData();
  }

  Future<void> fetchKaosData() async {
    try {
      String? authToken = box.read('token');
      var response = await http.get(
        Uri.parse(admin + 'kaos'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        kaosList = data.map((item) => Kaos.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load Kaos data');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void clearControllers() {
    namaController.clear();
    hargaController.clear();
    deskripsiController.clear();
    sizeController.clear();
  }

  Future<void> addKaos() async {
    try {
      String? authToken = box.read('token');

      var response = await http.post(
        Uri.parse(admin + 'addkaos'),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'NamaBarang': namaController.text,
          'Harga': hargaController.text,
          'Deskripsi': deskripsiController.text,
          'size': sizeController.text,
          'Gambar': await imageToBase64(_selectedImage),
        }),
      );

      if (response.statusCode == 201) {
        clearControllers();
        print('Data Kaos berhasil ditambahkan');
        fetchKaosData();
      } else {
        print('Failed to add Kaos data. Response body: ${response.body}');
        throw Exception('Failed to add Kaos data');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<String?> imageToBase64(File? imageFile) async {
    if (imageFile == null) {
      return null;
    }

    List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<void> updateKaos(int id) async {
    try {
      String? authToken = box.read('token');

      var response = await http.put(
        Uri.parse(admin + 'editkaos/$id'),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'NamaBarang': namaController.text,
          'Harga': hargaController.text,
          'Deskripsi': deskripsiController.text,
          'size': sizeController.text,
          'Gambar': await imageToBase64(_selectedImage),
        }),
      );

      if (response.statusCode == 200) {
        clearControllers();
        print('Data Kaos berhasil diupdate');
        fetchKaosData();
      } else {
        print('Failed to update Kaos data. Response body: ${response.body}');
        throw Exception('Failed to update Kaos data');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> deleteKaos(int id) async {
    try {
      String? authToken = box.read('token');

      var response = await http.delete(
        Uri.parse(admin + 'deletekaos/$id'),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        print('Data Kaos berhasil dihapus');
        fetchKaosData();
      } else {
        print('Failed to delete Kaos data. Response body: ${response.body}');
        throw Exception('Failed to delete Kaos data');
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
