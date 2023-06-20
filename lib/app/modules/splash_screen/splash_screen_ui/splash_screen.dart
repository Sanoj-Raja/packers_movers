import 'package:flutter/material.dart';
import 'package:packers_movers/app/constants/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.splashScreenLogo),
      ),
    );
  }
}
