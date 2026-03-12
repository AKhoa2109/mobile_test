import 'package:mobile_test_nextlab/core/constants/app_constants.dart';
import 'package:mobile_test_nextlab/features/auth/data/models/user_model.dart';
import 'package:mobile_test_nextlab/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<UserModel> login(String email, String password) async {
    try {
      if (email != AppConstants.mockUser['email'] ||
          password != AppConstants.mockUser['password']) {
        throw Exception('Login failed');
      }

      return UserModel.fromJson(AppConstants.mockUser);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
