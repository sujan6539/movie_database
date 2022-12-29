import 'package:flutter/material.dart';
import 'package:movie_database/presentation/model/hero_card_data.dart';

class HeroCard extends StatelessWidget {
  HeroCardModel heroCardModel;

  HeroCard({Key? key, required this.heroCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(heroCardModel.imageUrl),
          Text(heroCardModel.header,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(heroCardModel.title)
        ],
      ),
    );
  }
}
