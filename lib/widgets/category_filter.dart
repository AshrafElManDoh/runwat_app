import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Row(
        children: [
          Text(
            "Sort by",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 20),
          SvgPicture.asset("assets/svgs/select.svg"),
          Spacer(),
          SvgPicture.asset("assets/svgs/filter.svg"),
          SizedBox(width: 5),
          Text(
            "Filter",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 16),
          SvgPicture.asset("assets/svgs/grid.svg"),
          SizedBox(width: 16),
          SvgPicture.asset("assets/svgs/groups.svg"),
        ],
      ),
    );
  }
}
