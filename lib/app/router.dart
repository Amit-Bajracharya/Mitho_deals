import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/feature/auth/presentation/pages/login.dart';
import 'package:mitho_deals/feature/auth/presentation/pages/register_page.dart';
import 'package:mitho_deals/feature/home/presentation/pages/home_page.dart';
import 'package:mitho_deals/feature/introduction_screen/presentation/pages/introduction_page.dart';
import 'package:mitho_deals/splash_screen.dart';

class MyAppRouter {
  GoRouter routes = GoRouter(
    initialLocation: RouteConstants.splash,
    routes: [
      GoRoute(
        
        path: RouteConstants.splash,
        pageBuilder: (context, state) => const MaterialPage(child: SplashScreen()),
      ),
      GoRoute(
    
        path: RouteConstants.intro,
        pageBuilder: (context, state) => const MaterialPage(child: IntroductionPage()),
      ),
      GoRoute(
        path: RouteConstants.login,
        pageBuilder:(context, state) =>  MaterialPage(child: LoginPage())
      ),
      GoRoute(
        path: '/register',
        pageBuilder:(context, state) =>  MaterialPage(child: RegisterPage())
      ),
      GoRoute(
        path: RouteConstants.home,
        pageBuilder:(context, state) =>  MaterialPage(child: HomePage())
      )
    ],
  );
}
