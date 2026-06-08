import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class FormFieldsWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onLoginPressed;

  const FormFieldsWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.isLoading = false,
    this.onForgotPassword,
    this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppFormCard(
      children: [
        AppTextField(
          controller: emailController,
          label: 'Email',
          hint: 'Enter your email',
          prefixIcon: Icons.email_outlined,
          enabled: !isLoading,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Invalid email';
            }
            return null;
          },
        ),
        SizedBox(height: 12.h),
        AppTextField(
          controller: passwordController,
          label: 'Password',
          hint: 'Enter your password',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
          enabled: !isLoading,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            return null;
          },
        ),
        if (onForgotPassword != null)
          Align(
            alignment: Alignment.centerRight,
            child: AppButton(
              label: 'Forgot?',
              variant: AppButtonVariant.text,
              onPressed: isLoading ? null : onForgotPassword,
            ),
          ),
        SizedBox(height: 8.h),
        AppButton(
          label: 'Login',
          isLoading: isLoading,
          onPressed: onLoginPressed,
        ),
      ],
    );
  }
}
