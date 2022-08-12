import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/custom_app_bar.dart';

abstract class BasePageScreen extends StatefulWidget {
  const BasePageScreen({required Key? key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen>
    extends State<Page> {
  bool _isBack = true;
  bool _isAppBar = true;

  String appBarTitle();

  void onClickBackButton();

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
            onPressed: onClickBackButton
        ) : null,
        body: Container(
          child: body(),
          color: Colors.white,
        )
    );
  }

  Widget body();
}

