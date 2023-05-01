import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/resources/image_routes.dart';
import '../../../../core/resources/strings.dart';
import '../../../../data/remote/dto/news_model.dart';
import '../../../base/base_screen.dart';
import '../../../tools/utils.dart';
import '../../../widgets/image/corner_radius_image.dart';
import '../../../widgets/text/generic_label.dart';
import '../widgets/list_news_bloc.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({Key? key, required this.arguments}) : super(key: key);

  static Widget create(Object ars) =>
      NewsDetailsScreen(arguments: ars as ScreenDetailsArguments);

  final ScreenDetailsArguments arguments;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    changeNotificationBarColorIcon(isLight: false);
    void onClickBackButton() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: CustomAppBar(
        isBack: true,
        title: "Details screen",
        onPressed: onClickBackButton,
      ),
      body: Column(children: [
        SizedBox(
            width: double.infinity,
            child: Hero(
              tag: 'tagImage${arguments.index}',
              child: CornerRadiusImage(
                isAllCorner: false,
                cornerTopLeft: 4,
                cornerBottomLeft: 4,
                placeholder: newPlaceHolderImage,
                imageUrl: arguments.article.urlToImage,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 28),
            child: Column(
              children: [
                GenericLabel(
                    label: arguments.article.title ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                    lines: 4),
                const SizedBox(height: 12),
                GenericLabel(
                  label: arguments.article.content ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  lines: 10,
                ),
              ],
            )),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _launchUrl(arguments.article.url ?? "");
          },
          child: const Text('Ver mas'),
        ),
        const SizedBox(height: 12),
      ]),
    );
  }
}
