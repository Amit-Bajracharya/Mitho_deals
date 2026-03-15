import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_event.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_state.dart';

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
            // Handle auth states
            state.when(
              phoneCodeSent: (verificationId, phoneNumber) {
                setState(() => _isLoading = false);
                
                // Navigate to OTP page with data using GoRouter
                context.go(
                  '${RouteConstants.otp_verification}?verificationId=$verificationId&phoneNumber=$phoneNumber',
                );
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('OTP sent to $phoneNumber'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              phoneVerificationLoading: () {
                setState(() => _isLoading = true);
              },
              error: (message) {
                setState(() => _isLoading = false);
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }, 
              initial: () {
                setState(() => _isLoading = false);
              }, 
              loading: () {
                setState(() => _isLoading = true);
              }, 
              authenticated: (user) {
                setState(() => _isLoading = false);
                context.go(RouteConstants.home);
              }, 
              unauthenticated: () {
                setState(() => _isLoading = false);
              },
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return _buildPhoneForm();
            },
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
              // Title
              Text(
                'Phone Authentication',
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: 32.h),
              
              // Phone Number Input
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    // Country Code
                    Text(
                      '+977',
                      style: GoogleFonts.poppins(fontSize: 16.sp),
                    ),
                    SizedBox(width: 12.w),
                    
                    // Phone Input
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: '98XXXXXXXXX',
                          border: InputBorder.none,
                        ),
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
              
              // Send OTP Button
              ElevatedButton(
                onPressed: _isLoading ? null : _sendOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B35),
                  minimumSize: Size(double.infinity, 50.h),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Send OTP'),
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
      final authBloc = ServiceLocator.get<AuthBloc>();
      
      authBloc.add(
        AuthEvent.phoneVerificationRequested(
          phoneNumber: phoneNumber,
        ),
      );
    }
  }
}