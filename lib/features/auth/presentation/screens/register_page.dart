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
import '../widgets/register_fields_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _nameController = TextEditingController();
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
                AppSnackBar.showSuccess(context, 'Success! Please login.');
                context.go('/login');
              },
              unauthenticated: () {},
              error: (message) => AppSnackBar.showError(context, message),
              phoneCodeSent: (verificationId, phoneNumber) {},
              phoneVerificationLoading: () {},
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => _buildRegisterForm(context, state),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context, AuthState state) {
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
                SizedBox(height: 32.h),
                const AuthHeaderWidget(
                  title: 'Create Account',
                  subtitle: 'Join Mitho and find amazing deals',
                ),
                SizedBox(height: 24.h),
                RegisterFieldsWidget(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isLoading: isLoading,
                  onRegisterPressed: _onRegisterPressed,
                ),
                SizedBox(height: 20.h),
                BottomLinksWidget(
                  onPhoneAuth: () => context.go(RouteConstants.phone_auth),
                  onLogin: () => context.go('/login'),
                  showRegisterLink: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onRegisterPressed() {
    if (_formKey.currentState!.validate()) {
      ServiceLocator.get<AuthBloc>().add(AuthEvent.registerRequested(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ));
    }
  }
}
