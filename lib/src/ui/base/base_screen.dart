import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BasePageScreen extends StatefulWidget {
  const BasePageScreen({required Key? key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen>
    extends State<Page> {
  bool _isBack = true;
  bool _isAppBar = true;

  String appBarTitle();

  void onClickBackButton();

  void onClickCart();

  void isBackButton(bool isBack) {
    _isBack = isBack;
  }

  void isAppBar(bool isAppBar) {
    _isAppBar = isAppBar;
  }
}

mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _isAppBar ? CustomAppBar(
            isBack: _isBack,
            title: appBarTitle(),
            onPressed: onClickBackButton) : null,
        body: Container(
          color: Colors.white,
          child: body(),
        ));
  }

  Widget body();
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool isBack;
  final String title;
  final VoidCallback onPressed;

  const CustomAppBar({Key? key,
    this.height = kToolbarHeight,
    this.isBack = false,
    this.title = "",
    required this.onPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
