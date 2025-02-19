import 'package:flutter/material.dart';

class FetchEmpty extends StatelessWidget {
  final String emptyMessage;

  const FetchEmpty({super.key, required this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    return Text(
      emptyMessage,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
