import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool isBack;
  final bool centerTitle;
  final String title;
  final double elevation;
  final Color color;
  final VoidCallback onPressed;

  const CustomAppBar({
    this.height = kToolbarHeight,
    this.isBack = false,
    this.centerTitle = true,
    this.title = "",
    this.elevation = 0.0,
    this.color = Colors.transparent,
    required this.onPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      centerTitle: centerTitle,
      backgroundColor: color,
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      leading: isBack
          ? IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          onPressed();
        },
      )
          : Container(),
      systemOverlayStyle:
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }
}
