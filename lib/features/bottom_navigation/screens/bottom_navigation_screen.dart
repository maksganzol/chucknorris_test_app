import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_navigation_bar.dart';

class BottomNavigationContainer extends StatelessWidget {
  const BottomNavigationContainer({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavigationBar(
        onIndexChanged: child.goBranch,
        activeIndex: child.currentIndex,
      ),
    );
  }
}
