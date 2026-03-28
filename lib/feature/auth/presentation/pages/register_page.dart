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
import '../widgets/bottom_links_widget.dart';

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
              loading: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 18.h,
                          child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        ),
                        SizedBox(width: 16.w),
                        Text('Wait...', style: GoogleFonts.poppins(fontSize: 13.sp)),
                      ],
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              authenticated: (user) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Success! Please login.', style: GoogleFonts.poppins(fontSize: 13.sp)),
                    backgroundColor: Colors.green,
                  ),
                );
                context.go('/login');
              },
              unauthenticated: () {},
              error: (message) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message, style: GoogleFonts.poppins(fontSize: 13.sp)),
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
              return _buildRegisterForm(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context, AuthState state) {
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
                SizedBox(height: 48.h),
                
                AuthHeaderWidget(
                  title: 'Create Account',
                  subtitle: 'Join Mitho and find amazing deals',
                ),
                
                SizedBox(height: 32.h),
                
                _buildRegisterFields(isLoading),
                
                SizedBox(height: 24.h),
                
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

  Widget _buildRegisterFields(bool isLoading) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTextField(
            controller: _nameController,
            label: 'Full Name',
            hint: 'Enter your name',
            icon: Icons.person_outline,
            isLoading: isLoading,
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            hint: 'Enter your email',
            icon: Icons.email_outlined,
            isLoading: isLoading,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            controller: _passwordController,
            label: 'Password',
            hint: 'At least 6 characters',
            icon: Icons.lock_outline,
            isLoading: isLoading,
            obscureText: true,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: isLoading ? null : _onRegisterPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B35),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                elevation: 0,
              ),
              child: isLoading
                  ? Text('Processing...', style: GoogleFonts.poppins(fontSize: 14.sp))
                  : Text('Create Account', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isLoading = false,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: !isLoading,
      keyboardType: keyboardType,
      style: GoogleFonts.poppins(fontSize: 13.sp),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 18.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 1.5)),
        labelStyle: GoogleFonts.poppins(fontSize: 12.sp, color: const Color(0xFF636E72)),
        hintStyle: GoogleFonts.poppins(fontSize: 12.sp, color: const Color(0xFFB2BEC3)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Required';
        return null;
      },
    );
  }

  void _onRegisterPressed() {
    if (_formKey.currentState!.validate()) {
      final authBloc = ServiceLocator.get<AuthBloc>();
      authBloc.add(AuthEvent.registerRequested(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ));
    }
  }
}
