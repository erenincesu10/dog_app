import 'package:dog_app/app/data/datasources/remote/dog_remote_datasource_impl.dart';
import 'package:dog_app/app/data/repositories/dog_repository_impl.dart';
import 'package:dog_app/app/domain/datasource/remote/dog_remote_datasource.dart';
import 'package:dog_app/app/domain/repository/dog_repository.dart';
import 'package:dog_app/app/presentation/home/bloc/home_bloc.dart';
import 'package:dog_app/app/presentation/main/bloc/main_bloc.dart';
import 'package:dog_app/app/presentation/settings/bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  setupRepositories();
  setupDatasource();
  setupBLoC();
}

void setupRepositories() {
  getIt.registerLazySingleton<DogRepository>(
    () => DogRepositroyImpl(
      remoteDataSource: getIt(),
    ),
  );
}

void setupDatasource() {
  getIt.registerLazySingleton<DogRemoteDataSource>(
    () => DogRemoteDataSourceImpl(),
  );
}

void setupBLoC() {
  getIt
    ..registerLazySingleton<SettingsBloc>(
      () => SettingsBloc(),
    )
    ..registerLazySingleton<MainBloc>(
      () => MainBloc(),
    )
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(
        dogRepository: getIt(),
      ),
    );
}
