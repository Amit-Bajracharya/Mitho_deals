import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/introduction_bloc.dart';
import '../bloc/introduction_event.dart';
import '../bloc/introduction_state.dart';
import 'introduction_header_widget.dart';
import 'introduction_page_content.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({super.key});

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroductionBloc, IntroductionState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (s) {
            if (_pageController.hasClients && s.currentPage != _pageController.page?.round()) {
              _pageController.animateToPage(
                s.currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        body: SafeArea(
          child: BlocBuilder<IntroductionBloc, IntroductionState>(
            builder: (context, state) {
              return state.map(
                initial: (_) => const Center(child: CircularProgressIndicator()),
                loading: (_) => const Center(child: CircularProgressIndicator()),
                loaded: (s) => _buildContent(context, s),
                completed: (_) => const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, IntroductionStateLoaded state) {
    return Column(
      children: [
        IntroductionHeaderWidget(state: state),
        SizedBox(height: 55.h),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              context.read<IntroductionBloc>().add(IntroductionEvent.pageChanged(index));
            },
            itemCount: state.pages.length,
            itemBuilder: (context, index) {
              final page = state.pages[index];
              return IntroductionPageContent(
                page: page,
                isCurrentPage: index == state.currentPage,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
