import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:runway_app/models/product_model.dart';
import 'package:runway_app/widgets/category_filter.dart';
import 'package:runway_app/widgets/custom_app_bar.dart';
import 'package:runway_app/widgets/custom_model_container.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.title,
    required this.productModel,
  });
  final String title;
  final ProductModel productModel;
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
      body: ProductBody(productModel: productModel),
    );
  }
}

class ProductBody extends StatelessWidget {
  const ProductBody({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      minHeight: 100,
      maxHeight: MediaQuery.of(context).size.height * 0.4,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      panel: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 5),
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "₤${productModel.price}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.favorite_outline),
                SizedBox(width: 10),
                Text(
                  "450",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "Select color",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset("assets/svgs/select.svg"),
                    ],
                  ),
                  Spacer(),
                  Container(width: 2, height: 30, color: Colors.black12),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "Select size",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset("assets/svgs/select.svg"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Add to Bag",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CategoryFilter(),
          SizedBox(
            height: MediaQuery.of(context).size.height - (60 + 200),
            child: CustomModelWithoutBackground(imagePath: productModel.image),
          ),
        ],
      ),
    );
  }
}
