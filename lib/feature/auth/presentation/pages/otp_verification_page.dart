import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_event.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_state.dart';
import 'package:mitho_deals/feature/auth/presentation/widgets/otp_input_widget.dart';
import 'package:mitho_deals/feature/auth/presentation/widgets/otp_title_widget.dart';
import 'package:mitho_deals/feature/auth/presentation/widgets/otp_actions_widget.dart';

class OtpVerificationPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  
  const OtpVerificationPage({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  // 6 OTP controllers for 6 digits
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  
  // Focus nodes for auto-advance
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  
  bool _isLoading = false;
  String? _verificationId;
  String? _phoneNumber;

  @override
  void initState() {
    super.initState();
    
    // Set data from widget parameters
    setState(() {
      _verificationId = widget.verificationId;
      _phoneNumber = widget.phoneNumber;
    });
  }

  @override
  void dispose() {
    // Clean up controllers and focus nodes
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
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
              initial: () {
                setState(() => _isLoading = false);
              },
              loading: () {
                setState(() => _isLoading = true);
              },
              authenticated: (user) {
                setState(() => _isLoading = false);
                // Navigate to home on success
                Navigator.pushReplacementNamed(context, '/home');
              },
              unauthenticated: () {
                setState(() => _isLoading = false);
              },
              error: (message) {
                setState(() => _isLoading = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              phoneCodeSent: (verificationId, phoneNumber) {},
              phoneVerificationLoading: () {
                setState(() => _isLoading = true);
              },
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return _buildOtpForm();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOtpForm() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            
            // OTP Title Widget
            OtpTitleWidget(
              phoneNumber: _phoneNumber ?? 'your phone number',
            ),
            
            SizedBox(height: 40.h),
            
            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => OtpInputWidget(
                  controller: _otpControllers[index],
                  focusNode: _focusNodes[index],
                  isFirst: index == 0,
                  isLast: index == 5,
                  onChanged: (value) {
                    _onOtpChanged(value, index);
                  },
                ),
              ),
            ),
            
            SizedBox(height: 40.h),
            
            // OTP Actions Widget
            OtpActionsWidget(
              isLoading: _isLoading,
              onVerify: _verifyOTP,
              onResend: _resendOTP,
              onChangePhone: () {
                Navigator.pushReplacementNamed(context, '/phone_auth');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onOtpChanged(String value, int index) {
    // Auto-focus next field when digit entered
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index].unfocus();
      _focusNodes[index + 1].requestFocus();
    }
    
    // Auto-submit when all 6 digits are entered
    if (value.isNotEmpty && index == 5) {
      _verifyOTP();
    }
  }

  void _verifyOTP() {
    // Join all 6 digits
    final otp = _otpControllers.map((controller) => controller.text).join();
    
    if (otp.length == 6 && _verificationId != null) {
      final authBloc = ServiceLocator.get<AuthBloc>();
      
      authBloc.add(
        AuthEvent.phoneCodeVerified(
          verificationId: _verificationId!,
          smsCode: otp,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter all 6 digits'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _resendOTP() {
    if (_phoneNumber != null) {
      final authBloc = ServiceLocator.get<AuthBloc>();
      
      authBloc.add(
        AuthEvent.phoneVerificationRequested(
          phoneNumber: _phoneNumber!,
        ),
      );
      
      // Clear all OTP fields
      for (var controller in _otpControllers) {
        controller.clear();
      }
      
      // Focus first field
      _focusNodes[0].requestFocus();
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP sent successfully'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}