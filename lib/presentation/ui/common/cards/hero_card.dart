import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_database/presentation/model/hero_card_data.dart';
import 'package:movie_database/presentation/ui/common/general/rating_view.dart';

class HeroCard extends StatelessWidget {
  HeroCardModel heroCardModel;

  HeroCard({Key? key, required this.heroCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = 0.85 * size.width;
    return Align(
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 180, maxHeight: 200, minWidth: 200, maxWidth: width),
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            clipBehavior: Clip.hardEdge,
            children: [
              Image.network(
                heroCardModel.imageUrl,
                fit: BoxFit.fill,
              ),
              FrostedGlass(
                header: heroCardModel.header,
                title: heroCardModel.title,
                rating: heroCardModel.rating,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FrostedGlass extends StatelessWidget {
  String? header;

  String? title;

  String? rating;

  FrostedGlass({Key? key, this.header, this.title, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Text(
                      header ?? "",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  RatingView(text: rating ?? ""),
                ],
              ),
              Text(title ?? "")
            ],
          ),
        ),
      ),
    );
  }
}
