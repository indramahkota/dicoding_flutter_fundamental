import 'package:dicoding_flutter_fundamental/features/restaurant_details/contents/detail_body_content.dart';
import 'package:dicoding_flutter_fundamental/features/restaurant_details/contents/detail_head_content.dart';
import 'package:dicoding_flutter_fundamental/features/restaurant_details/provider/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {

  @override
  void initState() {
    final restaurantProvider = context.read<RestaurantProvider>();
    restaurantProvider.getDetailRestaurant(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(size: 30, color: Colors.white),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: Expanded(
            child: showHeaderData(value),
          ),
        );
      },
    );
  }

  Widget showHeaderData(RestaurantProvider state) {
    if (state.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/loader.json',
                fit: BoxFit.cover, width: 120),
            Text("Loading...")
          ],
        ),
      );
    }

    if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Icon(Icons.error, color: Colors.redAccent, size: 40),
            SizedBox(height: 20),
            Text(
              "${state.errorMessage}",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final result = state.restaurant;
    final name = result.name;
    final idPicture = result.pictureId;
    final city = result.city;
    final address = result.address;
    final rating = result.rating;
    final description = result.description;
    final category = result.categories;
    final menus = result.menus;
    final review = result.customerReviews;

    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        DetailHeadContent(
          idPicture: idPicture,
          name: name,
          address: address,
          rating: rating,
          city: city,
          categories: category,
        ),
        DetailBodyContent(
          menu: menus,
          review: review,
          description: description,
        ),
      ],
    );
  }
}
