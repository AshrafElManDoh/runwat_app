import 'package:flutter/material.dart';
import 'package:runway_app/cubits/home_cubit/home_cubit.dart';
import 'package:runway_app/widgets/category_widget.dart';
import 'package:runway_app/widgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Runway",
        leadingIconPath: "assets/svgs/menu.svg",
        trailingIconPath: "assets/svgs/notification.svg",
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()..playVideo(),
        child: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return SlidingUpPanel(
          minHeight: 180,
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          panel: const CategoryWidget(),
          body: state is HomeLoading
              ? const Center(child: CircularProgressIndicator())
              : AspectRatio(
                  aspectRatio: cubit.controller.value.aspectRatio,
                  child: VideoPlayer(cubit.controller),
                ),
        );
      },
    );
  }
}
