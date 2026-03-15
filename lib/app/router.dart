import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/core/guards/auth_guard.dart';
import 'package:mitho_deals/feature/auth/presentation/pages/login.dart';
import 'package:mitho_deals/feature/auth/presentation/pages/phone_auth_pages.dart';
import 'package:mitho_deals/feature/auth/presentation/pages/otp_verification_page.dart';
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
        pageBuilder:(context, state) =>  MaterialPage(child: AuthGuard.protectRoute(context, HomePage()))
      ),
      GoRoute(path: RouteConstants.phone_auth,
      pageBuilder: (context, state) => MaterialPage(child: PhoneAuthPage())
      ),
      GoRoute(path: RouteConstants.otp_verification, 
      pageBuilder: (context, state) {
        final verificationId = state.uri.queryParameters['verificationId'] ?? '';
        final phoneNumber = state.uri.queryParameters['phoneNumber'] ?? '';
        return MaterialPage(
          child: OtpVerificationPage(
            verificationId: verificationId,
            phoneNumber: phoneNumber,
          )
        );
      }
      )
    ],
  );
}
