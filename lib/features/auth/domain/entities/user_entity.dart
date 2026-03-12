class UserEntity {
  final int id;
  final String? username;
  final String email;
  final String password;
  final String? phone;
  final String? avatarUrl;

  const UserEntity({
    required this.id,
    this.username,
    required this.email,
    required this.password,
    this.phone,
    this.avatarUrl,
  });
}
