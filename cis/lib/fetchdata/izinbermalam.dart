class IzinBermalam {
  final int id;
  final int mahasiswaId;
  final String rencanaBerangkat;
  final String rencanaKembali;
  final String keperluan;
  final String tujuan;
  final int status;

  IzinBermalam({
    required this.id,
    required this.mahasiswaId,
    required this.rencanaBerangkat,
    required this.rencanaKembali,
    required this.keperluan,
    required this.tujuan,
    required this.status,
  });

  factory IzinBermalam.fromJson(Map<String, dynamic> json) {
    return IzinBermalam(
      id: json['id'],
      mahasiswaId: json['mahasiswa_id'],
      rencanaBerangkat: json['RencanaBerangkat'],
      rencanaKembali: json['RencanaKembali'],
      keperluan: json['Keperluan'],
      tujuan: json['Tujuan'],
      status: json['status'],
    );
  }
}
