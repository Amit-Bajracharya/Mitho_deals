import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../shared/widgets/shared_widgets.dart';
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
    final label = state.isLastPage
        ? 'Get Started'
        : (state.currentPage == 1 ? 'Continue' : 'Next');

    return AppButton(
      label: label,
      icon: state.isLastPage ? null : Icons.arrow_forward,
      iconTrailing: true,
      onPressed: () {
        if (state.isLastPage) {
          context.read<IntroductionBloc>().add(const IntroductionEvent.complete());
          context.pushReplacement(RouteConstants.login);
        } else {
          context.read<IntroductionBloc>().add(const IntroductionEvent.nextPage());
        }
      },
    );
  }
}
