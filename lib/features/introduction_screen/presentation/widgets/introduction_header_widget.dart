import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';
import '../bloc/introduction_bloc.dart';
import '../bloc/introduction_event.dart';
import '../bloc/introduction_state.dart';

class IntroductionHeaderWidget extends StatelessWidget {
  final IntroductionStateLoaded state;

  const IntroductionHeaderWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final isFirstPage = state.isFirstPage;
    final isLastPage = state.isLastPage;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: isFirstPage ? _buildLogoRow() : _buildBackButton(context),
            ),
          ),
          if (!isLastPage)
            AppButton(
              label: 'Skip',
              variant: AppButtonVariant.text,
              onPressed: () {
                context.read<IntroductionBloc>().add(const IntroductionEvent.skip());
              },
            )
          else
            AppText.link('3 OF 3', fontSize: 14.sp),
        ],
      ),
    );
  }

  Widget _buildLogoRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.asset(
              'assets/images/app_icon.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppTheme.primaryOrange,
                  child: const Icon(Icons.restaurant, color: Colors.white),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 10.w),
        const AppText.headline('Mitho Deals'),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<IntroductionBloc>().add(const IntroductionEvent.previousPage());
      },
      icon: Icon(Icons.arrow_back_ios, color: AppTheme.primaryOrange, size: 18.sp),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
