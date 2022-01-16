
class User {
  final int idUser;
  final String nama;
  final String username;
  final String password;

  User({
    required this.idUser,
    required this.nama,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['id_user'],
      nama: json['nama'],
      username: json['username'],
      password: json['password'],
    );
  }
}