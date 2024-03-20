import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.onIndexChanged,
    required this.activeIndex,
  });

  final ValueChanged<int> onIndexChanged;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: activeIndex,
      onTap: onIndexChanged,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.circle),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
    );
  }
}
