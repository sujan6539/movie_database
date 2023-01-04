import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  String text;

  RatingView({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,2.0, 8.0, 2.0),
          child: Text(text),
        ),
      ),
    ]);
  }
}
