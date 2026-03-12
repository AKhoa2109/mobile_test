import 'package:get_it/get_it.dart';
import 'package:mobile_test_nextlab/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_test_nextlab/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile_test_nextlab/features/auth/domain/usecase/auth_usecase.dart';
import 'package:mobile_test_nextlab/features/auth/presentation/cubit/login_cubit.dart';
import 'package:mobile_test_nextlab/features/contact/data/repositories/contact_repository_impl.dart';
import 'package:mobile_test_nextlab/features/contact/domain/repositories/contact_repository.dart';
import 'package:mobile_test_nextlab/features/contact/domain/usecase/load_contact_list_usecase.dart';
import 'package:mobile_test_nextlab/features/contact/presentation/cubit/contact_list_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  getIt.registerLazySingleton(() => Login(getIt<AuthRepository>()));

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<Login>()));

  getIt.registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl());

  getIt.registerLazySingleton(() => LoadContactListUsecase(getIt<ContactRepository>()));

  getIt.registerLazySingleton<ContactCubit>(() => ContactCubit(getIt<LoadContactListUsecase>()));
}
