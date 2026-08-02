import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/features/map/widgets/map_picker_text_field.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_header_widget.dart';


class VendorRegisterPage extends StatefulWidget {
  const VendorRegisterPage({super.key});

  @override
  State<VendorRegisterPage> createState() => _VendorRegisterPageState();
}

class _VendorRegisterPageState extends State<VendorRegisterPage> {
  final _restaurantNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  dynamic _selectedLocation;

  @override
  void dispose() {
    _restaurantNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    super.dispose();
  }

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
              loading: () => AppSnackBar.showLoading(context, message: 'Processing...'),
              authenticated: (_) {
                AppSnackBar.showSuccess(context, 'Profile created! Please login.');
                context.go('/login');
              },
              error: (message) => AppSnackBar.showError(context, message),
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
                _field(controller: _restaurantNameController, label: 'Restaurant Name', hint: 'Name', icon: Icons.store_rounded, isLoading: isLoading),
                SizedBox(height: 10.h),
                _field(controller: _emailController, label: 'Email', hint: 'Business email', icon: Icons.email_outlined, isLoading: isLoading, keyboardType: TextInputType.emailAddress),
                SizedBox(height: 10.h),
                _field(controller: _passwordController, label: 'Password', hint: 'Password', icon: Icons.lock_outline_rounded, isLoading: isLoading, obscureText: true),
                SizedBox(height: 10.h),
                _field(controller: _descriptionController, label: 'Description', hint: 'About you', icon: Icons.description_outlined, isLoading: isLoading, maxLines: 2),
                SizedBox(height: 10.h),
                LocationPickerField(),
                SizedBox(height: 20.h),
                AppButton(
                  label: 'Register Restaurant',
                  isLoading: isLoading,
                  onPressed: () => _onRegister(context),
                ),
                AppButton(
                  label: 'Back to Login',
                  variant: AppButtonVariant.text,
                  onPressed: () => context.go('/login'),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool isLoading,
    bool obscureText = false,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return AppTextField(
      controller: controller,
      label: label,
      hint: hint,
      prefixIcon: icon,
      obscureText: obscureText,
      maxLines: maxLines,
      enabled: !isLoading,
      keyboardType: keyboardType,
      validator: (val) => (val == null || val.isEmpty) ? 'Required' : null,
    );
  }


  void _onRegister(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_selectedLocation == null) {
        AppSnackBar.showError(context, 'Please select your location on the map.');
        return;
      }

      ServiceLocator.get<AuthBloc>().add(AuthEvent.registerVendorRequested(
        restaurantName: _restaurantNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        description: _descriptionController.text.trim(),
        address: _addressController.text.trim(),
        latitude: _selectedLocation!.latitude,
        longitude: _selectedLocation!.longitude,
      ));
    }
  }
}
