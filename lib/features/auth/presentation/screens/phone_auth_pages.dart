import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mitho_deals/features/auth/presentation/bloc/auth_event.dart';
import 'package:mitho_deals/features/auth/presentation/bloc/auth_state.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = ServiceLocator.get<AuthBloc>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocProvider.value(
        value: authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.when(
              phoneCodeSent: (verificationId, phoneNumber) {
                setState(() => _isLoading = false);
                context.go(
                  '${RouteConstants.otp_verification}?verificationId=$verificationId&phoneNumber=$phoneNumber',
                );
                AppSnackBar.showSuccess(context, 'OTP sent to $phoneNumber');
              },
              phoneVerificationLoading: () => setState(() => _isLoading = true),
              error: (message) {
                setState(() => _isLoading = false);
                AppSnackBar.showError(context, message);
              },
              initial: () => setState(() => _isLoading = false),
              loading: () => setState(() => _isLoading = true),
              authenticated: (user) {
                setState(() => _isLoading = false);
                context.go(RouteConstants.home);
              },
              unauthenticated: () => setState(() => _isLoading = false),
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => _buildPhoneForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneForm() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppText.title('Phone Authentication', fontSize: 24.sp),
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    AppText.body('+977', fontSize: 16.sp),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: AppTextField(
                        controller: _phoneController,
                        hint: '98XXXXXXXXX',
                        variant: AppTextFieldVariant.plain,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          if (value.length < 10) {
                            return 'Please enter valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              AppButton(
                label: 'Send OTP',
                isLoading: _isLoading,
                onPressed: _sendOTP,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendOTP() {
    if (_formKey.currentState!.validate()) {
      final phoneNumber = '+977${_phoneController.text.trim()}';
      ServiceLocator.get<AuthBloc>().add(
        AuthEvent.phoneVerificationRequested(phoneNumber: phoneNumber),
      );
    }
  }
}
