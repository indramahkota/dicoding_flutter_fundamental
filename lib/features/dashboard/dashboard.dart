import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late RestaurantRepository repository;
  @override
  void initState() {
    super.initState();
    repository = GetIt.I.get<RestaurantRepository>();

    _fetchRestaurants(); // Call the function on widget initialization
  }

  Future<void> _fetchRestaurants() async {
    debugPrint("Fetching restaurants..."); // Log before API call
    final result = await repository.getListRestaurant();
    debugPrint("Fetched restaurants: ${result.data.toString()}"); // Log after API call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 4,
              child: Lottie.asset(
                'assets/lottie/loader.json',
                fit: BoxFit.cover,
              ),
            ),
            const Gap(30),
            Text('Dashboard'),
          ],
        ),
      ),
    );
  }
}
