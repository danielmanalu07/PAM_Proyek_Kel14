class BookingRuangan {
  final int id;
  final int mahasiswaId;
  final int ruanganId;
  final String rencanaMulai;
  final String rencanaBerakhir;
  final String keperluan;
  final int status;

  BookingRuangan({
    required this.id,
    required this.mahasiswaId,
    required this.ruanganId,
    required this.rencanaMulai,
    required this.rencanaBerakhir,
    required this.keperluan,
    required this.status,
  });

  factory BookingRuangan.fromJson(Map<String, dynamic> json) {
    return BookingRuangan(
      id: json['id'],
      mahasiswaId: json['mahasiswa_id'],
      ruanganId: json['ruangan_id'],
      rencanaMulai: json['RencanaMulai'],
      rencanaBerakhir: json['RencanaBerakhir'],
      keperluan: json['Keperluan'],
      status: json['status'],
    );
  }
}
