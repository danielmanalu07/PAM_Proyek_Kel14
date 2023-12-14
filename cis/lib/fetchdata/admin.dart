class AdminData {
  final String? username;

  AdminData({required this.username});

  factory AdminData.fromJson(Map<String, dynamic> json) {
    return AdminData(
      username: json['username'],
    );
  }
}
