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
            state.maybeWhen(
              loading: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        SizedBox(width: 16.w, height: 16.h, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 1.5)),
                        SizedBox(width: 12.w),
                        Text('Processing...', style: GoogleFonts.poppins(fontSize: 11.sp)),
                      ],
                    ),
                  ),
                );
              },
              authenticated: (_) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile created! Please login.', style: GoogleFonts.poppins(fontSize: 11.sp)), backgroundColor: Colors.green),
                );
                context.go('/login');
              },
              error: (message) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message, style: GoogleFonts.poppins(fontSize: 11.sp)), backgroundColor: Colors.red),
                );
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => _buildForm(context, state),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, AuthState state) {
    final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 24.h),
                const AuthHeaderWidget(
                  title: 'Partner with Mitho',
                  subtitle: 'Start rescuing food today',
                ),
                SizedBox(height: 20.h),
                _buildField(controller: _restaurantNameController, label: 'Restaurant Name', hint: 'Name', icon: Icons.store_rounded, isLoading: isLoading),
                SizedBox(height: 10.h),
                _buildField(controller: _emailController, label: 'Email', hint: 'Business email', icon: Icons.email_outlined, isLoading: isLoading, keyboardType: TextInputType.emailAddress),
                SizedBox(height: 10.h),
                _buildField(controller: _passwordController, label: 'Password', hint: 'Password', icon: Icons.lock_outline_rounded, isLoading: isLoading, obscureText: true),
                SizedBox(height: 10.h),
                _buildField(controller: _descriptionController, label: 'Description', hint: 'About you', icon: Icons.description_outlined, isLoading: isLoading, maxLines: 2),
                SizedBox(height: 10.h),
                _buildField(controller: _addressController, label: 'Store Address', hint: 'Location', icon: Icons.location_on_outlined, isLoading: isLoading),
                SizedBox(height: 20.h),
                _buildRegisterButton(context, isLoading),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text('Back to Login', style: GoogleFonts.poppins(fontSize: 11.sp, color: const Color(0xFFFF6B35), fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({required TextEditingController controller, required String label, required String hint, required IconData icon, required bool isLoading, bool obscureText = false, int maxLines = 1, TextInputType? keyboardType}) {
    return TextFormField(
      controller: controller,
      enabled: !isLoading,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: GoogleFonts.poppins(fontSize: 11.sp),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        isDense: true,
        prefixIcon: Icon(icon, size: 16.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFF1F2F6))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFF1F2F6))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 1.2)),
        labelStyle: GoogleFonts.poppins(fontSize: 9.sp, color: const Color(0xFF636E72)),
        hintStyle: GoogleFonts.poppins(fontSize: 9.sp, color: Colors.grey[400]),
      ),
      validator: (val) => (val == null || val.isEmpty) ? 'Required' : null,
    );
  }

  Widget _buildRegisterButton(BuildContext context, bool isLoading) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _onRegister(context),
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF6B35), foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
        child: isLoading
            ? SizedBox(width: 16.w, height: 16.h, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
            : Text('Register Restaurant', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600)),
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
