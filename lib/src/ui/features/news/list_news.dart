import 'package:flutter/material.dart';

import '../../../tools/resources/image_rutes.dart';
import '../../widgets/corner_radius_image.dart';
import '../../widgets/generic_label.dart';
import 'news_view_model.dart';
import '../../../tools/utils_widgets.dart' as utils;


class ListNews extends StatelessWidget {

   const ListNews({ required this.value, required this.orientation, required this.size });

  final NewsViewModel value;
  final Orientation orientation;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: value.newsList.data?.articles!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                        height: size.height *
                            ((orientation == Orientation.landscape
                                ? 0.25
                                : 0.15)),
                        width: size.width * 0.3,
                        child:  CornerRadiusImage(
                          isAllCorner: false,
                          cornerTopLeft: 4,
                          cornerBottomLeft: 4,
                          placeholder: newPlaceHolderImage,
                          imageUrl: value.newsList.data?.articles![index].urlToImage,
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 7),
                      height: size.height *
                          (orientation == Orientation.landscape
                              ? 0.24
                              : 0.14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GenericLabel(
                            label:  value.newsList.data!.articles![index]
                                .title
                                .toString(),
                            style: TextStyle(
                              fontSize:
                              size.height > 700 ? 15 : 13,
                            ),
                            lines: 2,
                          ),
                          GenericLabel(
                            label:value.newsList.data!.articles![index]
                                .description!.length >
                                20
                                ? value.newsList.data!
                                .articles![index].description!
                                .substring(0, 20)
                                : value.newsList.data!
                                .articles![index].description
                                .toString(),
                            style: utils.getCustomFontTextStyle(
                              fontSizeFont: size.height > 700 ? 12 : 10,
                              fontWeightFont: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}