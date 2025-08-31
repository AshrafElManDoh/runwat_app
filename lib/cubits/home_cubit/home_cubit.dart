import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:runway_app/models/category_model.dart';
import 'package:video_player/video_player.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  late VideoPlayerController controller;

  List<CategoryModel> category = [
    CategoryModel(
        path: "assets/images/category/Women.png",
        name: "Women",
    ),
    CategoryModel(
      path: "assets/images/category/Men.png",
      name: "Men",
    ),
    CategoryModel(
      path: "assets/images/category/Kids.png",
      name: "Kids",
    ),
    CategoryModel(
      path: "assets/images/category/Deals.png",
      name: "Deals",
    ),
    CategoryModel(
      path: "assets/images/category/Health.png",
      name: "Health",
    ),
  ];

  playVideo() {
    emit(HomeLoading());

    controller = VideoPlayerController.asset("assets/video/video.mp4")
      ..initialize().then((_) {
        controller
          ..setLooping(true)
          ..play();

        emit(HomeVideo());
      });
  }
}
