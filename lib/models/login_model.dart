class Login {
  final int id;
  final String username;
  final int rol;
  final String rolName;
  final String token;

  Login({
    required this.id,
    required this.username,
    required this.rol,
    required this.rolName,
    required this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      id: json['id'] as int,
      username: json['username'] as String,
      rol: json['rol'] as int,
      rolName: json['rol_name'] as String,
      token: json['token'] as String,
    );
  }
}
