import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:mitho_deals/app/router.dart';
import 'package:mitho_deals/core/dependency_injection/auth_dependencies.dart';
import 'package:mitho_deals/core/dependency_injection/cart_dependencies.dart';
import 'package:mitho_deals/core/dependency_injection/deals_dependencies.dart';
import 'package:mitho_deals/core/dependency_injection/orders_dependencies.dart';
import 'package:mitho_deals/core/dependency_injection/vendor_dependencies.dart';

import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(url: dotenv.env['PROJECT_URL']!, anonKey: dotenv.env['API_KEY']!);

  // Register SupabaseClient in GetIt with explicit storage URL for v3 protocol
  final sl = GetIt.instance;
  sl.registerLazySingleton<SupabaseClient>(() => SupabaseClient(
    dotenv.env['PROJECT_URL']!,
    dotenv.env['API_KEY']!,
   // storageUrl: 'https://phwaysewexzldtnmcavo.storage.supabase.co/storage/v1',
  ));

  setupAuthDependencies();
  setupCartDependencies();
  setupDealsDependencies();
  setupOrdersDependencies();
  setupVendorDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = MyAppRouter().routes;
    
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
    
        );
      },
    );
  }
}