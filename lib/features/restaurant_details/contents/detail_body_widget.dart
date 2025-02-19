import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/menu_chip_widget.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/review_bubble_widget.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/title_section_widget.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class DetailBodyContent extends StatelessWidget {
  const DetailBodyContent({
    super.key,
    required this.description,
    this.menu,
    this.review = const [],
  });

  final String description;
  final Menus? menu;
  final List review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSectionWidget('Description'),
          ExpandableText(
            description,
            expandText: 'Read more',
            collapseText: 'Read less',
            maxLines: 4,
            linkColor: Colors.blue,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 12),
          TitleSectionWidget('Foods Menu'),
          MenuChipWidget(
            menuItem: menu?.foods.map((food) => food.name).toList() ?? [],
          ),
          SizedBox(height: 12),
          TitleSectionWidget('Drinks Menu'),
          MenuChipWidget(
            menuItem: menu?.drinks.map((drink) => drink.name).toList() ?? [],
          ),
          SizedBox(height: 12),
          TitleSectionWidget('Review'),
          Column(
            children: List.generate(review.length, (index) {
              var result = review[index];
              var nameSender = result.name;
              var date = result.date;
              var reviewText = result.review;
              return ReviewBubbleWidget(
                dateReview: date,
                textReview: reviewText,
                userReview: nameSender,
              );
            }),
          )
        ],
      ),
    );
  }
}
