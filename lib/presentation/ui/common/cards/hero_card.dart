import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_database/presentation/model/hero_card_data.dart';

class HeroCard extends StatelessWidget {
  HeroCardModel heroCardModel;

  HeroCard({Key? key, required this.heroCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = 0.85*size.width;
    return Align(
     alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 200,
          maxHeight: 300
        ),
        child: Container(
          width: width,
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
                Image.network(heroCardModel.imageUrl),
                FrostedGlass(
                  header: heroCardModel.header,
                  title: heroCardModel.title,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FrostedGlass extends StatelessWidget {
  String? header;

  String? title;

  FrostedGlass({Key? key, this.header, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                header ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(title ?? "")
            ],
          ),
        ),
      ),
    );
  }
}
