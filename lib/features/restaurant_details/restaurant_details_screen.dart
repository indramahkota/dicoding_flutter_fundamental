import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/fetch_error_widget.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/fetch_loading_widget.dart';
import 'package:dicoding_flutter_fundamental/provider/bookmark_provider.dart';
import 'package:dicoding_flutter_fundamental/provider/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contents/detail_body_widget.dart';
import 'contents/detail_head_widget.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantProvider>().getDetailRestaurant(id: id);
      context.read<BookmarkProvider>().getListFavorite();
    });

    return Consumer2<RestaurantProvider, BookmarkProvider>(
      builder: (context, restaurantProvider, bookmarkProvider, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(size: 30, color: Colors.white),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<RestaurantProvider>().getDetailRestaurant(id: id);
              context.read<BookmarkProvider>().getListFavorite();
            },
            child: _buildBody(restaurantProvider),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: _buildFloatingActionButton(
            restaurantProvider,
            bookmarkProvider,
          ),
        );
      },
    );
  }

  Widget _buildBody(RestaurantProvider restaurantProvider) {
    return restaurantProvider.isLoading
        ? FetchLoading()
        : (restaurantProvider.errorMessage?.isNotEmpty ?? false)
            ? FetchError(errorMessage: restaurantProvider.errorMessage!)
            : _buildDetails(restaurantProvider.restaurant);
  }

  Widget _buildDetails(Restaurant restaurant) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        DetailHeadContent(
          idPicture: restaurant.pictureId,
          name: restaurant.name,
          address: restaurant.address,
          rating: restaurant.rating,
          city: restaurant.city,
          categories: restaurant.categories,
        ),
        DetailBodyContent(
          menu: restaurant.menus,
          review: restaurant.customerReviews,
          description: restaurant.description,
        ),
      ],
    );
  }

  Widget? _buildFloatingActionButton(
    RestaurantProvider restaurantProvider,
    BookmarkProvider bookmarkProvider,
  ) {
    final restaurant = restaurantProvider.restaurant;
    if (restaurant.id.isEmpty) return null;
    final isFavorite = bookmarkProvider.restaurants.any(
      ((e) => e.id == restaurant.id),
    );

    return FloatingActionButton(
      onPressed: () async {
        isFavorite
            ? await bookmarkProvider.removeFavorite(restaurant.id)
            : await bookmarkProvider.insertFavorite(restaurant);
      },
      child: Icon(
        isFavorite ? Icons.bookmark : Icons.bookmark_outline,
        size: 32,
      ),
    );
  }
}
