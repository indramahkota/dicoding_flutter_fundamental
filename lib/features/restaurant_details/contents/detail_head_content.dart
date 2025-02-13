import 'package:dicoding_flutter_fundamental/constant/app_constant.dart';
import 'package:dicoding_flutter_fundamental/features/widgets/tag_widget.dart';
import 'package:flutter/material.dart';

class DetailHeadContent extends StatelessWidget {
  const DetailHeadContent({
    super.key,
    required this.idPicture,
    required this.name,
    required this.address,
    required this.rating,
    required this.city,
    required this.categories,
  });

  final String idPicture;
  final String name;
  final String address;
  final double rating;
  final String city;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Theme.of(context).colorScheme.primaryFixed,
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.9,
          image: NetworkImage('${AppConstant.baseImgUrl}/$idPicture'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(60),
                // Semi-transparent background
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white, // Ensures high contrast
                ),
              ),
            ),
            SizedBox(height: 4), // Adds spacing
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(60),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$address, $city',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(categories.length, (index) {
                      var category = categories[index];
                      var nameCategory = category.name;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TagWidget(
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.brown.shade800
                                  : Colors.brown.shade100,
                          text: nameCategory,
                        ),
                      );
                    }),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
