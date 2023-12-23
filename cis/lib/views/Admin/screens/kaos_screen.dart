import 'dart:io';

import 'package:cis/controllers/Admin/kaosController.dart';
import 'package:cis/fetchdata/kaos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KaosPage extends StatefulWidget {
  const KaosPage({Key? key});

  @override
  State<KaosPage> createState() => _KaosPageState();
}

class _KaosPageState extends State<KaosPage> {
  final KaosController _kaosController = Get.put(KaosController());
  File? _selectedImage;

  Widget listCard(int index) {
    Kaos kaos = _kaosController.kaosList[index];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _showUpdateKaosDialog(context, kaos);
                  },
                  child: Icon(FontAwesomeIcons.pen),
                ),
                TextButton(
                  onPressed: () {
                    _showDeleteKaosDialog(context, kaos);
                  },
                  child: Icon(FontAwesomeIcons.trash),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black),
                ),
              ),
              child: Image.network(
                kaos.gambar,
                width: 100,
                height: 100,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(kaos.namaBarang),
                        Text("Rp." + kaos.harga.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(kaos.deskripsi),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(kaos.size),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateKaosDialog(BuildContext context, Kaos kaos) {
    // Set the initial values of the text controllers
    _kaosController.namaController.text = kaos.namaBarang;
    _kaosController.hargaController.text = kaos.harga.toString();
    _kaosController.deskripsiController.text = kaos.deskripsi;
    _kaosController.sizeController.text = kaos.size;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Update Kaos'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _kaosController.namaController,
                    decoration: InputDecoration(labelText: 'Nama Barang'),
                  ),
                  TextField(
                    controller: _kaosController.hargaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Harga Barang'),
                  ),
                  TextField(
                    controller: _kaosController.deskripsiController,
                    decoration: InputDecoration(labelText: 'Deskripsi Barang'),
                  ),
                  TextField(
                    controller: _kaosController.sizeController,
                    decoration: InputDecoration(labelText: 'Size Barang'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController()
                            ..text = _selectedImage != null
                                ? _selectedImage!.path.split('/').toString()
                                : '',
                          readOnly: true,
                          decoration: InputDecoration(labelText: 'Gambar'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _pickImage();
                        },
                        child: Text('Choose File'),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    _kaosController.updateKaos(kaos.id);
                    Navigator.of(context).pop();
                  },
                  child: Text("Update"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showDeleteKaosDialog(BuildContext context, Kaos kaos) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Delete Kaos'),
              content: Text('Are you sure you want to delete this Kaos?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    _kaosController.deleteKaos(kaos.id);
                    Navigator.of(context).pop();
                  },
                  child: Text('Delete'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _kaosController.fetchKaosData();
  }

  void _showAddKaosDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Tambah Kaos'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _kaosController.namaController,
                    decoration: InputDecoration(labelText: 'Nama Barang'),
                  ),
                  TextField(
                    controller: _kaosController.hargaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Harga Barang'),
                  ),
                  TextField(
                    controller: _kaosController.deskripsiController,
                    decoration: InputDecoration(labelText: 'Deskripsi Barang'),
                  ),
                  TextField(
                    controller: _kaosController.sizeController,
                    decoration: InputDecoration(labelText: 'Size Barang'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController()
                            ..text = _selectedImage != null
                                ? _selectedImage!.path.split('/').toString()
                                : '',
                          readOnly: true,
                          decoration: InputDecoration(labelText: 'Gambar'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _pickImage();
                        },
                        child: Text('Choose File'),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    _kaosController.addKaos();
                    Navigator.of(context).pop();
                  },
                  child: Text("Simpan"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _pickImage() async {
    final pickedFile = await _kaosController.gambarController.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _kaosController.setSelectedImage(_selectedImage);
        _kaosController.gambarControllers.text =
            pickedFile.path.split('/').last;
      });
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
              'Data Kaos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
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
      body: FutureBuilder(
        future: _kaosController.fetchKaosData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      _showAddKaosDialog(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.black,
                    ),
                  ),
                  for (int i = 0; i < _kaosController.kaosList.length; i++)
                    listCard(i),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
