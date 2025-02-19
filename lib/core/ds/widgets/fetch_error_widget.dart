import 'package:flutter/material.dart';

class FetchError extends StatelessWidget {
  final String errorMessage;

  const FetchError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Icon(Icons.error, color: Colors.redAccent, size: 40),
          const SizedBox(height: 20),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
