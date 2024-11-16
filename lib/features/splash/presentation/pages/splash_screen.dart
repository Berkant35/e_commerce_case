import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'splash_screen_mixin.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Splash Screen',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
