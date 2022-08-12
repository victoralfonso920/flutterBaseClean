import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../tools/extensions/null_extensions.dart';
import '../../../../ui/widgets/generic_label.dart';
import '../../../../data/remote/dto/news/article.dart';
import '../../../../di/service_locator.dart';
import '../../../../tools/resources/image_rutes.dart';
import '../../../../tools/responsive.dart';
import '../../../widgets/corner_radius_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/custom_app_bar.dart';

class NewsDetailsScreen extends StatelessWidget {
  static Widget create(Object article) =>
      NewsDetailsScreen(article: article as Article);

  final Article article;
   const NewsDetailsScreen({Key? key ,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inject
    final responsive =  sl.get<Responsive>(param1: context);
    void onClickBackButton(){
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: CustomAppBar(
          isBack: true,
          title: "Details screen",
          onPressed: onClickBackButton
      ) ,
      body: Column(children: [
        SizedBox(
            height: responsive.hp(responsive.isTablet ? 40 : 35),
            width: responsive.width,
            child: CornerRadiusImage(
              isAllCorner: false,
              cornerTopLeft: 4,
              cornerBottomLeft: 4,
              placeholder: newPlaceHolderImage,
              imageUrl: article.urlToImage.orEmptyString,
            )),
        Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 28),
            child: Column(
              children: [
                GenericLabel(
                    label: article.title.orEmptyString,
                    style: TextStyle(
                      fontSize: responsive.dp(1.6),
                      fontWeight: FontWeight.w900,
                    ),
                    lines: 2),
                SizedBox(height: responsive.dp(1.2)),
                GenericLabel(
                    label: article.content.orEmptyString,
                    style: TextStyle(
                      fontSize: responsive.dp(1.2),
                      fontWeight: FontWeight.w400,
                    ),
                  lines: 4,
                ),
              ],
            )),
         SizedBox(height: responsive.dp(1)),
        ElevatedButton(
          onPressed: () => launch(article.url.orEmptyString),
          child: const Text('Ver mas'),
        ),
         SizedBox(height: responsive.dp(1.2)),
      ]),
    );
  }
}
