import 'package:dog_app/app/core/extensions/build_context_extensions.dart';
import 'package:dog_app/app/presentation/home/bloc/home_bloc.dart';
import 'package:dog_app/app/presentation/home/widgets/grid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          width: context.width,
          height: context.height,
          child: GridView.builder(
            key: const PageStorageKey(0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: bloc.searchController.text.isEmpty
                ? state.breedModels.length
                : state.searchList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
            itemBuilder: (context, index) => GridContainer(
              index: index,
              name: bloc.searchController.text.isEmpty
                  ? state.breedModels[index].name!
                  : state.searchList[index].name!,
              imageUrl: bloc.searchController.text.isEmpty
                  ? state.breedModels[index].imagePath!
                  : state.searchList[index].imagePath!,
            ),
          ),
        );
      },
    );
  }
}
