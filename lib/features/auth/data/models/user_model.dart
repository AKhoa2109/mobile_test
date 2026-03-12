import 'package:mobile_test_nextlab/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    super.username,
    required super.email,
    required super.password,
    super.phone,
    super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      avatarUrl: json['avatarUrl'],
    );
  }
}
