import 'package:flutter/material.dart';
import 'package:movie_database/presentation/ui/common/general/rating_view.dart';

class PosterCard extends StatelessWidget {
  String imageUrl;
  String title;
  String genre;
  String rating;

  PosterCard(
      {required this.imageUrl,
      required this.title,
      required this.genre,
      required this.rating,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 200, maxWidth: 300, minHeight: 100, maxHeight: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.network(
                      imageUrl,
                      scale: 2.0,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 12, 10, 0),
                        child: RatingView(text: rating))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Text(
              genre,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
