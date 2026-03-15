import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isFirst;
  final bool isLast;
  final Function(String)? onChanged;

  const OtpInputWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    this.isFirst = false,
    this.isLast = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        style: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2D3436),
        ),
        onChanged: onChanged,
      ),
    );
  }
}