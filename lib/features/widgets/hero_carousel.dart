import 'package:carousel_slider/carousel_slider.dart';
import 'package:dicoding_flutter_fundamental/features/widgets/hero_card.dart';
import 'package:dicoding_flutter_fundamental/features/widgets/hero_data.dart';
import 'package:flutter/material.dart';

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
          children: [
            CarouselSlider.builder(
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
          ],
        );
      },
    );
  }
}
