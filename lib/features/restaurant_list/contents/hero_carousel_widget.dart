import 'package:carousel_slider/carousel_slider.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/hero_card_widget.dart';
import 'package:flutter/material.dart';

import 'hero_data.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController controller = CarouselSliderController();
    final selected = ValueNotifier<int>(0);

    final data = HeroData.getData();

    return ValueListenableBuilder(
      valueListenable: selected,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Where ',
                      style: TextStyle(
                        fontFamily: "Plus Jakarta Sans",
                        fontSize: 20,
                        height: 40 / 32,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'do you want ',
                          style: TextStyle(color: Colors.orange.shade700),
                        ),
                        const TextSpan(
                          text: 'to go?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade700,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: data.length,
                carouselController: controller,
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  height: MediaQuery.sizeOf(context).height / 6,
                  onPageChanged: (index, reason) {
                    selected.value = index;
                  },
                ),
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return HeroCard(
                    quote: data[itemIndex].quote,
                    author: data[itemIndex].author,
                    iconPath: data[itemIndex].iconPath,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
