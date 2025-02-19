import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FetchLoading extends StatelessWidget {
  const FetchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/lottie/loader.json',
            fit: BoxFit.cover,
            width: 120,
          ),
          const Text("Loading..."),
        ],
      ),
    );
  }
}
