import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:runway_app/cubits/category_cubit/category_cubit.dart';
import 'package:runway_app/models/product_model.dart';
import 'package:runway_app/widgets/category_filter.dart';
import 'package:runway_app/widgets/custom_app_bar.dart';
import 'package:runway_app/widgets/custom_model_container.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        leadingIconPath: "assets/svgs/arrow-left.svg",
        trailingIconPath: "assets/svgs/cart.svg",
        onPressedLeading: () {
          Navigator.pop(context);
        },
      ),
      body: BlocProvider(
        create: (context) => CategoryCubit(),
        child: CategoryBody(),
      ),
    );
  }
}

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryFilter(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              itemCount: context.read<CategoryCubit>().products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (context, index) => ModelItem(
                productModel: context.read<CategoryCubit>().products[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ModelItem extends StatelessWidget {
  const ModelItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomModelContainer(imagePath: productModel.image),
        SizedBox(height: 14),
        Text(
          productModel.title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "₤${productModel.price}",
              maxLines: 1,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            LikeButton(
              size: 25,
              likeBuilder: (isLiked) {
                return !isLiked
                    ? Icon(Icons.favorite_outline)
                    : Icon(Icons.favorite, color: Colors.red);
              },
            ),
          ],
        ),
      ],
    );
  }
}
