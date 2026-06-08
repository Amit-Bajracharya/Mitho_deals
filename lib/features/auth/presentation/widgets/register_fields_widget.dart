import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class RegisterFieldsWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback onRegisterPressed;

  const RegisterFieldsWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.onRegisterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppFormCard(
      children: [
        _field(
          controller: nameController,
          label: 'Full Name',
          hint: 'Enter your name',
          icon: Icons.person_outline,
        ),
        SizedBox(height: 12.h),
        _field(
          controller: emailController,
          label: 'Email',
          hint: 'Enter your email',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 12.h),
        _field(
          controller: passwordController,
          label: 'Password',
          hint: 'At least 6 characters',
          icon: Icons.lock_outline,
          obscureText: true,
        ),
        SizedBox(height: 16.h),
        AppButton(
          label: isLoading ? 'Wait...' : 'Create Account',
          size: AppButtonSize.compact,
          isLoading: isLoading,
          onPressed: onRegisterPressed,
        ),
      ],
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return AppTextField(
      controller: controller,
      label: label,
      hint: hint,
      prefixIcon: icon,
      obscureText: obscureText,
      enabled: !isLoading,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Required';
        return null;
      },
    );
  }
}
