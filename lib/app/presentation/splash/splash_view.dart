import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/core/get_it/get_it.dart';
import 'package:dog_app/app/presentation/home/bloc/home_bloc.dart';
import 'package:dog_app/app/presentation/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStatus.success) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainView()));
          }
        },
        bloc: getIt.get<HomeBloc>()..add(const FetchBreedsEvent()),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SizedBox(
              width: context.width,
              height: context.height,
              child: Center(
                child: Container(
                  width: context.width * 0.2,
                  height: context.width * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/img_appicon.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
