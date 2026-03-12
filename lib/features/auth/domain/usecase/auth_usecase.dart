import 'package:mobile_test_nextlab/features/auth/domain/entities/user_entity.dart';
import 'package:mobile_test_nextlab/features/auth/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;
  Login(this.repository);
  Future<UserEntity> call(String email, String password) =>
      repository.login(email, password);
}
