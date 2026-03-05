import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/feature/introduction_screen/presentation/pages/introduction_page.dart';
import 'package:mitho_deals/splash_screen.dart';

class MyAppRouter {
  GoRouter routes = GoRouter(
    initialLocation: RouteConstants.splash,
    routes: [
      GoRoute(
        name: 'splash',
        path: RouteConstants.splash,
        pageBuilder: (context, state) => const MaterialPage(child: SplashScreen()),
      ),
      GoRoute(
        name: 'introduction_screen',
        path: RouteConstants.intro,
        pageBuilder: (context, state) => const MaterialPage(child: IntroductionPage()),
      ),
    ],
  );
}
