import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/theme/app_theme.dart';
import '../bloc/introduction_bloc.dart';
import '../bloc/introduction_state.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroductionBloc, IntroductionState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox.shrink(),
          loading: (_) => const SizedBox.shrink(),
          completed: (_) => const SizedBox.shrink(),
          loaded: (loadedState) => _buildIndicators(loadedState),
        );
      },
    );
  }

  Widget _buildIndicators(IntroductionStateLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        state.pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: state.currentPage == index ? 32.w : 8.w,
          decoration: BoxDecoration(
            color: state.currentPage == index
                ? AppTheme.primaryOrange
                : AppTheme.border,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }
}
