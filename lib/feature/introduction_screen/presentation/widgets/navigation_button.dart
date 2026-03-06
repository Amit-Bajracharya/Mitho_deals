import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../shared/theme/app_theme.dart';
import '../bloc/introduction_bloc.dart';
import '../bloc/introduction_event.dart';
import '../bloc/introduction_state.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroductionBloc, IntroductionState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox.shrink(),
          loading: (_) => const SizedBox.shrink(),
          completed: (_) => const SizedBox.shrink(),
          loaded: (loadedState) => _buildButton(context, loadedState),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context, IntroductionStateLoaded state) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          if (state.isLastPage) {
            context.read<IntroductionBloc>().add(const IntroductionEvent.complete());
            context.pushReplacement(RouteConstants.home);
          } else {
            context.read<IntroductionBloc>().add(const IntroductionEvent.nextPage());
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
  }
}
