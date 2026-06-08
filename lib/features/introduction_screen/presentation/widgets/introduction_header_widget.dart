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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isFirstPage)
            Row(
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
            )
          else
            IconButton(
              onPressed: () {
                context.read<IntroductionBloc>().add(const IntroductionEvent.previousPage());
              },
              icon: Icon(Icons.arrow_back_ios, color: AppTheme.primaryOrange, size: 18.sp),
            ),
          if (!isLastPage)
            AppButton(
              label: 'Skip',
              variant: AppButtonVariant.text,
              width: null,
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
}
