import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/extensions/strings_extensions.dart';
import '../../../domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
    this.article,
    this.onArticlePressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);
  final ArticleEntity? article;
  final bool? isRemovable;
  final void Function(ArticleEntity article)? onRemove;
  final void Function(ArticleEntity article)? onArticlePressed;

  @override
  Widget build(BuildContext context) {
    void _onTap() {
      if (onArticlePressed != null) {
        onArticlePressed!(article!);
      }
    }

    void _onRemove() {
      if (onRemove != null) {
        onRemove!(article!);
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            _BuildImage(
              urlImage: article?.urlToImage.orEmptyString,
            ),
            _BuildTitleAndDescription(
              title: article?.title,
              description: article?.description,
              publishedAt: article?.publishedAt,
            ),
            _BuildRemovableArea(
              isRemovable: isRemovable,
              onRemove: _onRemove,
              onArticlePressed: onArticlePressed,
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildImage extends StatelessWidget {
  const _BuildImage({Key? key, required this.urlImage}) : super(key: key);
  final String? urlImage;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
      imageUrl: urlImage.orEmptyString,
      imageBuilder: (context, imageProvider) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
            ),
          ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                child: CupertinoActivityIndicator(),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                ),
              ),
            ),
          ),
      errorWidget: (context, url, error) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                child: Icon(Icons.error),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                ),
              ),
            ),
          ));
}

class _BuildTitleAndDescription extends StatelessWidget {
  const _BuildTitleAndDescription(
      {Key? key,
      required this.title,
      required this.description,
      required this.publishedAt})
      : super(key: key);
  final String? title;
  final String? description;
  final String? publishedAt;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title.orEmptyString,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Butler',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),

              // Description
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    description.orEmptyString,
                    maxLines: 2,
                  ),
                ),
              ),

              // Datetime
              Row(
                children: [
                  const Icon(Icons.timeline_outlined, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    publishedAt.orEmptyString,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class _BuildRemovableArea extends StatelessWidget {
  const _BuildRemovableArea(
      {Key? key,
      required this.isRemovable,
      required this.onRemove,
      required this.onArticlePressed})
      : super(key: key);
  final bool? isRemovable;
  final void Function() onRemove;
  final void Function(ArticleEntity article)? onArticlePressed;

  @override
  Widget build(BuildContext context) {
    if (isRemovable!) {
      return GestureDetector(
        onTap: () => onRemove(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }
}
