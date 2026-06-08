import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/bottom_links_widget.dart';
import '../widgets/form_fields_widget.dart';

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
              loading: () => AppSnackBar.showLoading(context),
              authenticated: (user) {
                AppSnackBar.showSuccess(context, 'Welcome back, ${user.name}!');
                if (user.role == 'vendor') {
                  context.go(RouteConstants.vendorHome);
                } else {
                  context.go(RouteConstants.home);
                }
              },
              unauthenticated: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              error: (message) => AppSnackBar.showError(context, message),
              phoneCodeSent: (verificationId, phoneNumber) {},
              phoneVerificationLoading: () {},
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => _buildLoginForm(context, state),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, AuthState state) {
    final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 48.h),
                const AuthHeaderWidget(
                  title: 'Mitho Deals',
                  subtitle: 'Save money, reduce food waste',
                ),
                SizedBox(height: 40.h),
                FormFieldsWidget(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isLoading: isLoading,
                  onForgotPassword: () {},
                  onLoginPressed: _onLoginPressed,
                ),
                SizedBox(height: 24.h),
                BottomLinksWidget(
                  onPhoneAuth: () => context.go(RouteConstants.phone_auth),
                  onRegister: () => context.push('/role-select'),
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
      ServiceLocator.get<AuthBloc>().add(AuthEvent.loginRequested(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ));
    }
  }
}
