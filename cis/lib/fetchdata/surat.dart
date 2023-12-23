class Surat {
  final int id;
  final int mahasiswaId;
  final String Tujuan;
  final String TanggalPengambilan;
  final int status;

  Surat({
    required this.id,
    required this.mahasiswaId,
    required this.Tujuan,
    required this.TanggalPengambilan,
    required this.status,
  });

  factory Surat.fromJson(Map<String, dynamic> json) {
    return Surat(
      id: json['id'],
      mahasiswaId: json['mahasiswa_id'],
      Tujuan: json['Tujuan'],
      TanggalPengambilan: json['TanggalPengambilan'],
      status: json['status'],
    );
  }
}
