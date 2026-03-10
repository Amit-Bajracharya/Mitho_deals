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
                    content: Text('Welcome ${user.name}!'),
                    backgroundColor: Colors.green,
                  ),
                );
                // TODO: Navigate to home
                context.go(RouteConstants.home);
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
                
                // Logo and Title
                _buildHeader(),
                
                SizedBox(height: 50.h),
                
                // Login Form
                _buildFormFields(isLoading),
                
                SizedBox(height: 30.h),
                
                // Bottom Links
                _buildBottomLinks(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B35), // Orange color
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6B35).withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Icon(
            Icons.restaurant,
            color: Colors.white,
            size: 40,
          ),
        ),
        
        SizedBox(height: 24.h),
        
        // Title
        Text(
          'Mitho Deals',
          style: GoogleFonts.poppins(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2D3436),
          ),
        ),
        
        SizedBox(height: 8.h),
        
        // Subtitle
        Text(
          'Find the best food deals in town',
          style: GoogleFonts.poppins(
            fontSize: 13.sp,
            color: const Color(0xFF636E72),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields(bool isLoading) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
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
          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon:  Icon(Icons.email_outlined, size: 22.sp),
               contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w), // Reduce vertical padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 2),
              ),
              labelStyle: GoogleFonts.poppins(fontSize:  13.sp,color: const Color(0xFF636E72)),
              hintStyle: GoogleFonts.poppins(fontSize: 13.sp,color: const Color(0xFFB2BEC3)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          
          SizedBox(height: 20.h),
          
          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon:  Icon(Icons.lock_outline, size: 22.sp),
               contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 2),
              ),
              labelStyle: GoogleFonts.poppins(fontSize: 13.sp,color: const Color(0xFF636E72)),
              hintStyle: GoogleFonts.poppins(fontSize: 13.sp,color: const Color(0xFFB2BEC3)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          
          SizedBox(height: 8.h),
          
          // Forgot Password (optional)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO: Implement forgot password
              },
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                  color: const Color(0xFFFF6B35),
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
          
          SizedBox(height: 8.h),
          
          // Login Button
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: isLoading ? null : _onLoginPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B35),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text('Logging in...'),
                      ],
                    )
                  : Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomLinks(BuildContext context) {
    return Column(
      children: [
       
        
        // Phone Auth Option
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'OR',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF636E72),
                  fontSize: 14.sp,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        
        SizedBox(height: 20.h),
        
        // Phone Login Button
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: OutlinedButton.icon(
            onPressed: () {
              // TODO: Navigate to phone auth
            },
            icon: const Icon(Icons.phone, color: Color(0xFFFF6B35)),
            label: Text(
              'Login with Phone',
              style: GoogleFonts.poppins(
                color: const Color(0xFFFF6B35),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFFF6B35)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        
        SizedBox(height: 15.h),
        
        // Register Link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: GoogleFonts.poppins(
                color: const Color(0xFF636E72),
                fontSize: 13.sp,
              ),
            ),
            GestureDetector(
              onTap: () {
                // TODO: Navigate to register page
                context.go('/register');
              },
              child: Text(
                'Register',
                style: GoogleFonts.poppins(
                  color: const Color(0xFFFF6B35),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        
        SizedBox(height: 20.h),
      ],
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