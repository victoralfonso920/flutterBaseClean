import 'package:clean_core/src/core/extensions/strings_extensions.dart';
import 'package:clean_core/src/core/theme/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/image_routes.dart';
import '../../../../core/resources/strings.dart';
import '../../../../core/routes/routes.dart';
import '../../../../data/remote/dto/news_model.dart';
import '../../../widgets/image/corner_radius_image.dart';
import '../../../widgets/text/generic_label.dart';



class ListItemBloc extends StatelessWidget {

  const ListItemBloc({Key? key, required this.articles,}) : super(key: key);
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, int index) {
        return GestureDetector(
          onTap: () {
            final args = ScreenDetailsArguments(index: index, article: articles[index]);
            Navigator.pushNamed(context, Routes.newsDetails, arguments: args);

          },
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              child : Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                        child: Wrap(
                          children: [
                            Hero(
                              tag: 'tagImage$index',
                              child:  CornerRadiusImage(
                                height: 100,
                                width: 100,
                                isAllCorner: false,
                                cornerTopLeft: 4,
                                cornerBottomLeft: 4,
                                placeholder: newPlaceHolderImage,
                                imageUrl: articles[index].urlToImage,
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(right: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GenericLabel(
                              label: articles[index]
                                  .title.orEmptyString
                                  .toString(),
                              style: fontBoldSize(16),
                              lines: 2,
                            ),
                            GenericLabel(
                              label: articles[index].description
                                  .toString().orEmptyString,
                              style: fontRegularSize(12),
                              lines: 3,
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

class ScreenDetailsArguments {
  ScreenDetailsArguments({
    required this.index,
    required this.article
  } );
  final int index;
  final Article article;
}
