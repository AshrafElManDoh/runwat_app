import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:runway_app/models/product_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  List<ProductModel> products = [
    ProductModel(
      title: "Top Man Black",
      price: "20",
      image: "assets/images/models/model1.png",
    ),
    ProductModel(
      title: "Top man black with Trous..",
      price: "50",
      image: "assets/images/models/model2.png",
    ),
    ProductModel(
      title: "Deep gray essential regul..",
      price: "26",
      image: "assets/images/models/model3.png",
    ),
    ProductModel(
      title: "Gray coat and white T-sh..",
      price: "100",
      image: "assets/images/models/model4.png",
    ),
    ProductModel(
      title: "Top Man Black",
      price: "20",
      image: "assets/images/models/model1.png",
    ),
    ProductModel(
      title: "Top man black with Trous..",
      price: "50",
      image: "assets/images/models/model2.png",
    ),
    ProductModel(
      title: "Deep gray essential regul..",
      price: "26",
      image: "assets/images/models/model3.png",
    ),
    ProductModel(
      title: "Gray coat and white T-sh..",
      price: "100",
      image: "assets/images/models/model4.png",
    ),
  ];
}
