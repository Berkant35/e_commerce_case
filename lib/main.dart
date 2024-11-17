import 'package:e_commerce_case/core/config/api_config.dart';
import 'package:e_commerce_case/core/routes/app_router.dart';
import 'package:e_commerce_case/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/api_helper/api_connector.dart';
import 'core/constants/paths.dart';
import 'core/theme/theme.dart';
import 'injection.dart' as di;

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('storefront');
  di.initializeDependencies();

  var apiConnector = di.injector.get<ApiConnector>();
  apiConnector.init(ApiConfig.baseUrl, ApiConfig.headers);



  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      const ProviderScope(
        child: StoreFrontApp(),
      ),
    );
  });
}

class StoreFrontApp extends StatelessWidget {
  const StoreFrontApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp.router(
        theme: lightTheme,
        routerConfig: AppRouter.router,
      );
    });
  }
}
