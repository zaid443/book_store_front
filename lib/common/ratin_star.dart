import 'package:flutter/material.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({Key? key, required this.rate, required this.iconSize}) : super(key: key);
  final double rate;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return RatingStars(
      editable: false,
      rating: rate,
      color: Colors.amber,
      iconSize: iconSize,
    );
  }
}
