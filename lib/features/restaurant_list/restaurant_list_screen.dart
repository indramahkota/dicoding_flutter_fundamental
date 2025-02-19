import 'package:dicoding_flutter_fundamental/core/domain/list_item.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/fetch_empty_widget.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/fetch_error_widget.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/fetch_loading_widget.dart';
import 'package:dicoding_flutter_fundamental/provider/restaurants_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'contents/hero_carousel_widget.dart';
import 'contents/restaurant_card_widget.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantsProvider>().getListRestaurant();
    });

    return Consumer<RestaurantsProvider>(
      builder: (context, restaurantsProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Align(
              alignment: Alignment.centerLeft,
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Colors.orange.shade400, Colors.red.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  'Eats Ease',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        height: 40 / 32,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {
                    context.push('/settings');
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ),
              )
            ],
            elevation: 4,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<RestaurantsProvider>().getListRestaurant();
            },
            child: _buildBody(restaurantsProvider),
          ),
        );
      },
    );
  }

  Widget _buildBody(RestaurantsProvider restaurantsProvider) {
    final items = restaurantsProvider.items;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is HeaderItem) return HeroCarousel();
        if (item is LoadingItem) return FetchLoading();
        if (item is EmptyItem) {
          return FetchEmpty(emptyMessage: "No Data Available");
        }
        if (item is ErrorItem) return FetchError(errorMessage: item.message);
        if (item is ContentItem<Restaurant>) {
          return RestaurantCard(restaurant: item.content);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
