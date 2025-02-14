import 'package:dicoding_flutter_fundamental/constant/app_constant.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/core/ds/themes/dark_theme.dart';
import 'package:dicoding_flutter_fundamental/core/provider/theme_provider.dart';
import 'package:dicoding_flutter_fundamental/features/dashboard/provider/restaurants_provider.dart';
import 'package:dicoding_flutter_fundamental/features/widgets/hero_carousel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});



  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    final restaurantsProvider = context.read<RestaurantsProvider>();
    restaurantsProvider.getListRestaurant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(
      builder: (context, value, child) {
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
                child: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, _) => IconButton(
                    onPressed: () {
                      themeProvider.changeMode();
                    },
                    icon: Icon(
                      themeProvider.themeData == darkMode
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      size: 30,
                      color: themeProvider.themeData == darkMode
                          ? Colors.yellow[300]
                          : Colors.blue[300],
                    ),
                  ),
                ),
              )
            ],
            elevation: 4,
          ),
          body: _buildContent(value),
        );
      },
    );
  }

  Widget _buildContent(RestaurantsProvider state) {
    final int listSize =
        state.restaurants.isEmpty ? 2 : state.restaurants.length + 1;

    return ListView.builder(
      itemCount: listSize,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildHeader();
        }

        final restaurantIndex = index - 1;
        if (restaurantIndex >= state.restaurants.length) {
          if (state.isLoading) {
            return Center(
              child: Column(
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
        }

        return _buildListItem(state.restaurants[restaurantIndex]);
      },
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
              const SizedBox(height: 8),
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
          child: const HeroCarousel(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildListItem(Restaurant restaurant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: InkWell(
        onTap: () {
          context.push('/restaurant_details/${restaurant.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  '${AppConstant.baseImgUrl}/${restaurant.pictureId}',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, color: Colors.grey[600]),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      restaurant.city,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
