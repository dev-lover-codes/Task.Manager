import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import '../widgets/loading_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppLogo(size: 120),
            SizedBox(height: 60),
            LoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
