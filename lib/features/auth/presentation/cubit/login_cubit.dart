import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test_nextlab/features/auth/domain/usecase/auth_usecase.dart';
import 'package:mobile_test_nextlab/features/auth/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Login loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final result = await loginUseCase(email, password);
      if (result != null) {
        emit(LoginSuccess(result));
      } else {
        emit(LoginFailure('Login failed'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
