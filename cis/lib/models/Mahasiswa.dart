class Mahasiswa {
  late String id;
  late String nim;
  late String ktp;
  late String nohp;
  late String nama;
  late String email;
  late String password;

  Mahasiswa();

  factory Mahasiswa.fromJson(Map<String, dynamic> json) =>
      Mahasiswa._$MahasiswaFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaToJson(this);

  factory Mahasiswa._$MahasiswaFromJson(Map<String, dynamic> json) =>
      Mahasiswa()
        ..id = json['id'] as String
        ..ktp = json['ktp'] as String
        ..nim = json['nim'] as String
        ..nama = json['nama'] as String
        ..nohp = json['nohp'] as String
        ..email = json['email'] as String
        ..password = json['password'] as String;

  Map<String, dynamic> _$MahasiswaToJson(Mahasiswa instance) =>
      <String, dynamic>{
        'id': instance.id,
        'ktp': instance.ktp,
        'nim': instance.nim,
        'nohp': instance.nohp,
        'nama': instance.nama,
        'email': instance.email,
        'password': instance.password,
      };
}
