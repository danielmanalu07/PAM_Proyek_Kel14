class MahasiswaData {
  final String? nama;
  final int? id;
  final String? nim;

  MahasiswaData({required this.nama, required this.nim, required this.id});

  factory MahasiswaData.fromJson(Map<String, dynamic> json) {
    return MahasiswaData(
      id: json['id'],
      nama: json['nama'],
      nim: json['nim'],
    );
  }
}
