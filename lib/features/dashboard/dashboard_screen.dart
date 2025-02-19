import 'package:dicoding_flutter_fundamental/navigation/named_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;

  const DashboardScreen({required this.child, super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _currentIndex = ValueNotifier<int>(0);

  void _onTap(BuildContext context, int index) {
    _currentIndex.value = index;
    switch (index) {
      case 0:
        context.go(NamedRouter.restaurantList);
        break;
      case 1:
        context.go(NamedRouter.bookmarkPage);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (BuildContext context, value, _) {
          return BottomNavigationBar(
            currentIndex: _currentIndex.value,
            onTap: (index) => _onTap(context, index),
            useLegacyColorScheme: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
            ],
          );
        },
      ),
    );
  }
}
