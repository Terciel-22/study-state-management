import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const MyBottomNavigationBar({
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.countertops),
          label: "Counter",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Todo",
        ),
      ],
      onTap: (value) {
        if (value == 0) {
          context.go('/');
        }
        if (value == 1) {
          context.go('/todo');
        }
      },
    );
  }
}
