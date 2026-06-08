import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class BottomLinksWidget extends StatelessWidget {
  final VoidCallback? onPhoneAuth;
  final VoidCallback? onRegister;
  final VoidCallback? onLogin;
  final bool showRegisterLink;

  const BottomLinksWidget({
    super.key,
    this.onPhoneAuth,
    this.onRegister,
    this.onLogin,
    this.showRegisterLink = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppDividerLabel(),
        SizedBox(height: 20.h),
        AppButton(
          label: 'Login with Phone',
          variant: AppButtonVariant.outlined,
          icon: Icons.phone,
          onPressed: onPhoneAuth,
        ),
        SizedBox(height: 15.h),
        if (showRegisterLink)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText.body("Don't have an account? "),
              GestureDetector(
                onTap: onRegister,
                child: const AppText.link('Register'),
              ),
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText.body('Already have an account? '),
              GestureDetector(
                onTap: onLogin,
                child: const AppText.link('Login'),
              ),
            ],
          ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
