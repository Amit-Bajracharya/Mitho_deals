import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_header_widget.dart';

class VendorRegisterPage extends StatelessWidget {
  VendorRegisterPage({super.key});

  final _restaurantNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
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
                        Text('Processing...', style: GoogleFonts.poppins(fontSize: 13.sp)),
                      ],
                    ),
                  ),
                );
              },
              authenticated: (user) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Profile created! Please login.', style: GoogleFonts.poppins(fontSize: 13.sp)),
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
              phoneCodeSent: (_, __) {},
              phoneVerificationLoading: () {},
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return _buildForm(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, AuthState state) {
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
              children: [
                SizedBox(height: 32.h),
                const AuthHeaderWidget(
                  title: 'Partner with Mitho',
                  subtitle: 'Register your restaurant and start rescuing food',
                ),
                SizedBox(height: 24.h),
                _buildField(
                  controller: _restaurantNameController,
                  label: 'Restaurant Name',
                  hint: 'Enter your restaurant name',
                  icon: Icons.store_rounded,
                  isLoading: isLoading,
                ),
                SizedBox(height: 14.h),
                _buildField(
                  controller: _emailController,
                  label: 'Business Email',
                  hint: 'Enter your business email',
                  icon: Icons.email_outlined,
                  isLoading: isLoading,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 14.h),
                _buildField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Create a password',
                  icon: Icons.lock_outline_rounded,
                  isLoading: isLoading,
                  obscureText: true,
                ),
                SizedBox(height: 14.h),
                _buildField(
                  controller: _descriptionController,
                  label: 'Description',
                  hint: 'Tell us about your restaurant',
                  icon: Icons.description_outlined,
                  isLoading: isLoading,
                  maxLines: 2,
                ),
                SizedBox(height: 14.h),
                _buildField(
                  controller: _addressController,
                  label: 'Store Address',
                  hint: 'Where should customers pick up food?',
                  icon: Icons.location_on_outlined,
                  isLoading: isLoading,
                ),
                SizedBox(height: 24.h),
                _buildRegisterButton(context, isLoading),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    'Back to Login',
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      color: const Color(0xFFFF6B35),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool isLoading,
    bool obscureText = false,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      enabled: !isLoading,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: GoogleFonts.poppins(fontSize: 13.sp),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 18.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFFF1F2F6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFFF1F2F6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 1.5),
        ),
        labelStyle: GoogleFonts.poppins(fontSize: 12.sp, color: const Color(0xFF636E72)),
        hintStyle: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.grey[400]),
      ),
      validator: (val) => (val == null || val.isEmpty) ? 'Required' : null,
    );
  }

  Widget _buildRegisterButton(BuildContext context, bool isLoading) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _onRegister(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: isLoading
            ? SizedBox(width: 20.w, height: 20.h, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
            : Text(
                'Register Restaurant',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  void _onRegister(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ServiceLocator.get<AuthBloc>().add(AuthEvent.registerVendorRequested(
        restaurantName: _restaurantNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        description: _descriptionController.text.trim(),
        address: _addressController.text.trim(),
      ));
    }
  }
}
