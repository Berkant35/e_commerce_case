import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_case/core/routes/route_names.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Animasyon Kontrolcüsü
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Opacity Animasyonu
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Animasyonu başlat ve HomeScreen'e yönlendir
    _startSplash();
  }

  Future<void> _startSplash() async {
    await _animationController.forward(); // Animasyonu başlat
    await Future.delayed(const Duration(seconds: 1)); // Splash süresi
    if (mounted) {
      context.goNamed(RouteNames.home); // HomeScreen'e yönlendir
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _opacityAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animasyonlu Logo
                  const Icon(
                    Icons.shopping_cart,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  // Animasyonlu Başlık
                  Text(
                    "Welcome to IDEASOFT",
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
