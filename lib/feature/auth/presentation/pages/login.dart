import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/form_fields_widget.dart';
import '../widgets/bottom_links_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authBloc = ServiceLocator.get<AuthBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider.value(
        value: authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Row(
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(width: 16),
                        Text('Logging in...'),
                      ],
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              authenticated: (user) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Welcome back, ${user.name}!'),
                    backgroundColor: Colors.green,
                  ),
                );
                
                if (user.role == 'vendor') {
                  context.go(RouteConstants.vendorHome);
                } else {
                  context.go(RouteConstants.home);
                }
              },
              unauthenticated: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              error: (message) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              phoneCodeSent: (verificationId, phoneNumber) {},
              phoneVerificationLoading: () {},
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return _buildLoginForm(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, AuthState state) {
    final isLoading = state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                
                // Logo and Title - Using separated widget
                AuthHeaderWidget(
                  title: 'Mitho Deals',
                  subtitle: 'Find the best food deals in town',
           
                ),
                
                SizedBox(height: 50.h),
                
                // Login Form - Using separated widget
                FormFieldsWidget(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isLoading: isLoading,
                  onForgotPassword: () {
                    // TODO: Implement forgot password
                  },
                  onLoginPressed: _onLoginPressed,
                ),
                
                SizedBox(height: 30.h),
                
                // Bottom Links
                BottomLinksWidget(
                  onPhoneAuth: () {
                    context.go(RouteConstants.phone_auth);
                  },
                  onRegister: () {
                    context.push('/role-select');
                  },
                  showRegisterLink: true, // Show register link
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      final authBloc = ServiceLocator.get<AuthBloc>();
      authBloc.add(AuthEvent.loginRequested(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ));
    }
  }
}
