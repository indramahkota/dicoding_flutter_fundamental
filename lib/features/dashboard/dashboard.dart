import 'package:dicoding_flutter_fundamental/core/ds/themes/dark_theme.dart';
import 'package:dicoding_flutter_fundamental/core/provider/theme_provider.dart';
import 'package:dicoding_flutter_fundamental/features/dashboard/bloc/restaurants_bloc.dart';
import 'package:dicoding_flutter_fundamental/features/widgets/hero_carousel.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late RestaurantsBloc bloc;

  @override
  void initState() {
    bloc = RestaurantsBloc(repository: GetIt.I.get<RestaurantRepository>())
      ..add(RestaurantsInitEvent())
      ..add(RestaurantsShowEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantsBloc, RestaurantsState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
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
            ],
          ),
        );
      },
    );
  }
}
