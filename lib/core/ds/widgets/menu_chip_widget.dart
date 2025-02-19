import 'package:flutter/material.dart';

class MenuChipWidget extends StatelessWidget {
  final List<String> menuItem;

  const MenuChipWidget({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: menuItem.map((item) {
        return Chip(
          label: Text(
            item,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
        );
      }).toList(),
    );
  }
}
