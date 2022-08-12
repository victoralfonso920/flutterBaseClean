import 'package:clean_core/src/tools/extensions/log_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../tools/extensions/null_extensions.dart';
import '../../../../data/remote/dto/news/article.dart';
import '../../../../di/service_locator.dart';
import '../../../../navigation/routes.dart';
import '../../../../tools/resources/image_rutes.dart';
import '../../../../tools/responsive.dart';
import '../../../widgets/corner_radius_image.dart';
import '../../../widgets/generic_label.dart';
import '../../../../tools/utils_widgets.dart' as utils;


class ListItemBloc extends StatelessWidget {
  final List<Article> articles;

  const ListItemBloc({Key? key, required this.articles,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inject
    final responsive =  sl.get<Responsive>(param1: context);
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, int index) {
        return GestureDetector(
            onTap: () =>
            Navigator.pushNamed(context, Routes.newsDetails, arguments: articles[index]),

          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Card(
              child : Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                        height: responsive.hp(responsive.isTablet ? 25 : 15),
                        width: responsive.wp(35),
                        child: CornerRadiusImage(
                          isAllCorner: false,
                          cornerTopLeft: 4,
                          cornerBottomLeft: 4,
                          placeholder: newPlaceHolderImage,
                          imageUrl: articles[index].urlToImage,
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(right: 7),
                        height: responsive.hp(responsive.isTablet ? 24 : 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GenericLabel(
                              label: articles[index]
                                  .title.orEmptyString
                                  .toString(),
                              style: TextStyle(
                                fontSize:responsive.dp(1.6),
                              ),
                              lines: 2,
                            ),
                            GenericLabel(
                              label:articles[index]
                                  .description.orEmptyString.length >
                                  20
                                  ?
                              articles[index].description!
                                  .substring(0, 20)
                                  : articles[index].description
                                  .toString().orEmptyString,
                              style: utils.getCustomFontTextStyle(
                                fontSizeFont: responsive.dp(1.2),
                                fontWeightFont: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      },
    );
  }
}
