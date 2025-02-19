import 'package:dicoding_flutter_fundamental/core/ds/widgets/fetch_empty_widget.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/fetch_error_widget.dart';
import 'package:dicoding_flutter_fundamental/core/ds/widgets/fetch_loading_widget.dart';
import 'package:dicoding_flutter_fundamental/features/bookmark/contents/header_list_widget.dart';
import 'package:dicoding_flutter_fundamental/provider/bookmark_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contents/restaurant_card_widget.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookmarkProvider>().getListFavorite();
    });

    return Consumer<BookmarkProvider>(
      builder: (context, bookmarkProvider, child) {
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
            actions: [],
            elevation: 4,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<BookmarkProvider>().getListFavorite();
            },
            child: _buildBody(context, bookmarkProvider),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, BookmarkProvider bookmarkProvider) {
    return ListView.separated(
      itemCount: bookmarkProvider.restaurants.isEmpty
          ? 2
          : bookmarkProvider.restaurants.length + 1,
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemBuilder: (context, index) {
        if (index == 0) {
          return HeaderList();
        }

        final restaurantIndex = index - 1;
        if (restaurantIndex >= bookmarkProvider.restaurants.length) {
          return bookmarkProvider.isLoading
              ? FetchLoading()
              : (bookmarkProvider.errorMessage?.isNotEmpty ?? false)
                  ? FetchError(errorMessage: bookmarkProvider.errorMessage!)
                  : FetchEmpty(emptyMessage: "No saved bookmarks yet.");
        }

        return RestaurantCard(
          restaurant: bookmarkProvider.restaurants[restaurantIndex],
        );
      },
    );
  }
}
