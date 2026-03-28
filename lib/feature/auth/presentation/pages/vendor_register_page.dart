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
                  const SnackBar(
                    content: Row(
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(width: 16),
                        Text('Creating vendor account...'),
                      ],
                    ),
                  ),
                );
              },
              authenticated: (user) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Vendor account created! Please login.'),
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
                    content: Text(message),
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
                SizedBox(height: 40.h),
                const AuthHeaderWidget(
                  title: 'Partner with Mitho',
                  subtitle: 'Register your restaurant and start rescuing food',
                ),
                SizedBox(height: 30.h),
                _buildField(
                  controller: _restaurantNameController,
                  label: 'Restaurant Name',
                  hint: 'Enter your restaurant name',
                  icon: Icons.store_rounded,
                  isLoading: isLoading,
                ),
                SizedBox(height: 16.h),
                _buildField(
                  controller: _emailController,
                  label: 'Business Email',
                  hint: 'Enter your business email',
                  icon: Icons.email_outlined,
                  isLoading: isLoading,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                _buildField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Create a password',
                  icon: Icons.lock_outline_rounded,
                  isLoading: isLoading,
                  obscureText: true,
                ),
                SizedBox(height: 16.h),
                _buildField(
                  controller: _descriptionController,
                  label: 'Description',
                  hint: 'Tell us about your restaurant',
                  icon: Icons.description_outlined,
                  isLoading: isLoading,
                  maxLines: 3,
                ),
                SizedBox(height: 16.h),
                _buildField(
                  controller: _addressController,
                  label: 'Store Address',
                  hint: 'Where should customers pick up food?',
                  icon: Icons.location_on_outlined,
                  isLoading: isLoading,
                ),
                SizedBox(height: 30.h),
                _buildRegisterButton(context, isLoading),
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
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 22.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 2),
        ),
        labelStyle: GoogleFonts.poppins(fontSize: 14.sp),
        hintStyle: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.grey),
      ),
      validator: (val) => (val == null || val.isEmpty) ? 'Required field' : null,
    );
  }

  Widget _buildRegisterButton(BuildContext context, bool isLoading) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _onRegister(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                'Register Restaurant',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
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
