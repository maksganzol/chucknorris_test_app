import 'package:chucknorris_app/router/router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goToCategoriesAfterDelay();
  }

  void _goToCategoriesAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    appRouter.go(AppRoutes.categoriesList);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
