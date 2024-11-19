import 'package:e_commerce_case/core/routes/route_names.dart';
import 'package:e_commerce_case/features/home/presentation/pages/home/home_screen.dart';
import 'package:e_commerce_case/features/home/presentation/pages/product/product_detail.dart';
import 'package:e_commerce_case/features/splash/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/productDetail/:id',
        name: RouteNames.productDetail, // Rota adı
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return ProductDetail(id: id ?? "");
        },
      ),
    ],
  );
}
