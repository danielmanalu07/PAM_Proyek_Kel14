class Kaos {
  final int id;
  final String namaBarang;
  final String gambar;
  final int harga;
  final String size;
  final String deskripsi;

  Kaos(
      {required this.id,
      required this.namaBarang,
      required this.gambar,
      required this.harga,
      required this.size,
      required this.deskripsi});

  factory Kaos.fromJson(Map<String, dynamic> json) {
    return Kaos(
      id: json['id'],
      namaBarang: json['NamaBarang'],
      gambar: json['Gambar'],
      harga: json['Harga'],
      size: json['size'],
      deskripsi: json['Deskripsi'],
    );
  }
}
