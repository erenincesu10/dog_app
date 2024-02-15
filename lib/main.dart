import 'package:dog_app/app/core/constants/color_constant.dart';
import 'package:dog_app/app/core/get_it/get_it.dart';
import 'package:dog_app/app/presentation/home/home_view.dart';
import 'package:dog_app/app/presentation/settings/bloc/settings_bloc.dart';
import 'package:dog_app/app/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupGetIT();
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0,
              backgroundColor: ColorConstant.primaryColor),
          scaffoldBackgroundColor: ColorConstant.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
