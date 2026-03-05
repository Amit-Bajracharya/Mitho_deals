import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../shared/theme/app_theme.dart';
import '../bloc/introduction_bloc.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroductionBloc, IntroductionState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 52.h,
          child: ElevatedButton(
            onPressed: () {
              if (state.isLastPage) {
                context.read<IntroductionBloc>().add(CompleteIntroductionEvent());
                context.pushReplacement(RouteConstants.home);
              } else {
                context.read<IntroductionBloc>().add(NextPageEvent());
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryOrange,
              foregroundColor: AppTheme.textLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.isLastPage ? 'Get Started' : (state.currentPage == 1 ? 'Continue' : 'Next'),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.textLight,
                    fontSize: 15.sp
                  ),
                ),
                if (!state.isLastPage) ...[
                  SizedBox(width: 8.w),
                  Icon(Icons.arrow_forward, size: 20.sp),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
