import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/get_it/get_it.dart';
import 'package:dog_app/app/presentation/home/bloc/home_bloc.dart';
import 'package:dog_app/app/presentation/main/bloc/main_bloc.dart';
import 'package:dog_app/app/presentation/main/main_view.dart';
import 'package:dog_app/app/presentation/settings/bloc/settings_bloc.dart';
import 'package:dog_app/app/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupGetIT();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<SettingsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<MainBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              scrolledUnderElevation: 0,
              backgroundColor: ColorConstant.primaryColor),
          scaffoldBackgroundColor: ColorConstant.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashView(),
      ),
    );
  }
}
