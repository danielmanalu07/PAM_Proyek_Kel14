class IzinKeluar {
  final int id;
  final int mahasiswaId;
  final String rencanaBerangkat;
  final String rencanaKembali;
  final String keperluan;
  final int status;

  IzinKeluar({
    required this.id,
    required this.mahasiswaId,
    required this.rencanaBerangkat,
    required this.rencanaKembali,
    required this.keperluan,
    required this.status,
  });

  factory IzinKeluar.fromJson(Map<String, dynamic> json) {
    return IzinKeluar(
      id: json['id'],
      mahasiswaId: json['mahasiswa_id'],
      rencanaBerangkat: json['RencanaBerangkat'],
      rencanaKembali: json['RencanaKembali'],
      keperluan: json['Keperluan'],
      status: json['status'],
    );
  }
}
