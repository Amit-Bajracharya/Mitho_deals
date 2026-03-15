import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_state.dart';

class AuthGuard {
  // LOGIC 1: Check if user is authenticated
  static bool isAuthenticated() {
    try {
      // Get the current auth state
      final authBloc = ServiceLocator.get<AuthBloc>();
      final currentState = authBloc.state;
      
      // Check if user is authenticated
      return currentState.when(
        initial: () => false,           // Not logged in
        loading: () => false,           // Still loading
        authenticated: (user) => true,  // Logged in
        unauthenticated: () => false,   //  Not logged in
        error: (message) => false,      // Error state
        phoneCodeSent: (vId, phone) => false,    // Phone auth in progress
        phoneVerificationLoading: () => false,    // Phone auth loading
      );
    } catch (e) {
      // If auth bloc is not available, assume not authenticated
      return false;
    }
  }

  // LOGIC 2: Protect a route
  static Widget protectRoute(BuildContext context, Widget child) {
    if (isAuthenticated()) {
      //  User is logged in → Show the page
      return child;
    } else {
      // User not logged in → Redirect to login
      // Use addPostFrameCallback to avoid build-time navigation
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      
      // Show loading while redirecting
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}