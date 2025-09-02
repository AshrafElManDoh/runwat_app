import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingIconPath,
    required this.trailingIconPath,
    this.onPressedLeading,
    this.onPressedtrailing,
  });
  final String title;
  final String leadingIconPath, trailingIconPath;
  final void Function()? onPressedLeading, onPressedtrailing;

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      forceMaterialTransparency: true,
      centerTitle: true,
      leading: IconButton(
        onPressed: onPressedLeading,
        icon: SvgPicture.asset(leadingIconPath),
      ),
      actions: [
        IconButton(
          onPressed: onPressedtrailing,
          icon: SvgPicture.asset(trailingIconPath),
        ),
      ],
    );
  }
}
