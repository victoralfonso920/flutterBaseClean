
import 'package:clean_core/src/ui/base/base_screen.dart';
import 'package:flutter/material.dart';
import '../../../data/remote/tools/response_classify.dart';
import '../../../di/service_locator.dart';
import '../../../tools/resources/strings.dart';
import 'list_news.dart';
import 'news_view_model.dart';
import 'package:provider/provider.dart';
import '../../../tools/utils_widgets.dart' as utils;
import '../../../ui/widgets/generic_label.dart';

class HomeScreen extends BasePageScreen {
  const HomeScreen({required Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BasePageScreenState<HomeScreen> with BaseScreen {
  //Injector
  final NewsViewModel viewModel = sl.get<NewsViewModel>();

  //variables
  bool isButtonTapped = false;

  @override
  void initState() {
    isBackButton(true);
    isAppBar(false);
    viewModel.loadData();
    super.initState();
  }

  // TO GIVE THE TITLE OF THE APP BAR
  @override
  String appBarTitle() {
    return "Home";
  }

  @override
  void isBackButton(bool isBack) {
    super.isBackButton(isBack);
  }

  // THIS IS BACK BUTTON CLICK HANDLER
  @override
  void onClickBackButton() {
    print("BACK BUTTON CLICKED FROM HOME");
    Navigator.of(context).pop();
  }

  // THIS WILL RETURN THE BODY OF THE SCREEN
  @override
  Widget body() {
    return buildListView(viewModel);
  }

  Widget buildListView(NewsViewModel viewModel) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<NewsViewModel>(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, value, child) {
          if (value.newsList.status == Status.ERROR) {
            return Center(
                child: GenericLabel(
              label: value.newsList.error!,
              style: utils.getCustomFontTextStyle(
                fontSizeFont: 20.0,
                fontWeightFont: FontWeight.bold,
              ),
            ));
          } else if (value.newsList.status == Status.COMPLETED) {
            if (value.newsList.data != null &&
                value.newsList.data!.articles!.isNotEmpty) {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  // articles list
                  ListNews(
                    value: value,
                    orientation: orientation,
                    size: size,
                  ),
                ],
              );
            } else {
              return const Center(
                  child: GenericLabel(
                label: errorListArticles,
              ));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
