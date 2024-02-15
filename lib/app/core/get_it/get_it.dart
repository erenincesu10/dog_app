import 'package:dog_app/app/presentation/settings/bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  setupRepositories();
  setupDatasource();
  setupBLoC();
}

void setupRepositories() {
  // getIt.registerLazySingleton<TodoRepository>(
  //   () => TodoRepositoryImpl(
  //     todoLocalDatasource: getIt(),
  //     todoRemoteDatasource: getIt(),
  //   ),
  // );
}

void setupDatasource() {
  // getIt.registerLazySingleton<TodoLocalDatasourceImpl>(
  //   () => TodoLocalDatasourceImpl(),
  // );
  // getIt.registerLazySingleton<TodoRemoteDatasourceImpl>(
  //   () => TodoRemoteDatasourceImpl(),
  // );
}

void setupBLoC() {
  getIt.registerLazySingleton<SettingsBloc>(() => SettingsBloc());
}
