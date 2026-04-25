import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/core/guards/auth_guard.dart';
import 'package:mitho_deals/features/auth/presentation/pages/login.dart';
import 'package:mitho_deals/features/auth/presentation/pages/phone_auth_pages.dart';
import 'package:mitho_deals/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:mitho_deals/features/auth/presentation/pages/register_page.dart';
import 'package:mitho_deals/features/auth/presentation/pages/role_selection_page.dart';
import 'package:mitho_deals/features/auth/presentation/pages/vendor_register_page.dart';
import 'package:mitho_deals/features/vendor/presentation/pages/vendor_home_page.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/features/deals/presentation/screens/deal_details_screen.dart';
import 'package:mitho_deals/features/deals/presentation/screens/deals_list_screen.dart';
import 'package:mitho_deals/features/deals/presentation/screens/add_deal_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:mitho_deals/features/home/presentation/pages/home_page.dart';
import 'package:mitho_deals/features/cart/presentation/pages/cart_page.dart';
import 'package:mitho_deals/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mitho_deals/features/introduction_screen/presentation/pages/introduction_page.dart';
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
        path: '/role-select',
        pageBuilder:(context, state) =>  MaterialPage(child: RoleSelectionPage())
      ),
      GoRoute(
        path: '/vendor-register',
        pageBuilder:(context, state) =>  MaterialPage(child: VendorRegisterPage())
      ),
      GoRoute(
        path: RouteConstants.vendorHome,
        pageBuilder:(context, state) =>  MaterialPage(child: AuthGuard.protectRoute(context, const VendorHomePage()))
      ),
      GoRoute(
        path: RouteConstants.home,
        pageBuilder:(context, state) =>  MaterialPage(child: AuthGuard.protectRoute(context, const HomePage()))
      ),
      GoRoute(
        path: RouteConstants.dealDetails,
        pageBuilder: (context, state) {
          final deal = state.extra as DealEntity;
          return MaterialPage(child: DealDetailsScreen(deal: deal));
        },
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
      },
      ),
      GoRoute(
        path: RouteConstants.dealsList,
        pageBuilder:(context, state) =>  const MaterialPage(child: DealsListScreen())
      ),
      GoRoute(
        path: '/add-deal',
        pageBuilder:(context, state) {
          return MaterialPage(
            child: BlocProvider.value(
              value: ServiceLocator.get<DealsBloc>(),
              child: const AddDealScreen(),
            ),
          );
        }
      ),
      GoRoute(
        path: RouteConstants.cart,
        pageBuilder:(context, state) {
          return MaterialPage(
            child: BlocProvider(
              create: (_) => GetIt.instance<CartBloc>(),
              child: const CartPage(),
            ),
          );
        }
      )
    ],
  );
}
