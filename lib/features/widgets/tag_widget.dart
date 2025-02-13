import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
  });

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text),
    );
  }
}
