import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../data/repositories/introduction_repository_impl.dart';
import '../bloc/introduction_bloc.dart';
import '../bloc/introduction_event.dart';
import '../bloc/introduction_state.dart';
import '../widgets/introduction_page_content.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        
        final repository = IntroductionRepositoryImpl(snapshot.data!);
        
        return BlocProvider(
          create: (context) => IntroductionBloc(repository)
            ..add(const IntroductionEvent.loadPages()),
          child: const IntroductionView(),
        );
      },
    );
  }
}

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
            if (s.currentPage != _pageController.page?.round()) {
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
        _buildHeader(state),
        
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

  Widget _buildHeader(IntroductionStateLoaded state) {
    final isFirstPage = state.isFirstPage;
    final isLastPage = state.isLastPage;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back arrow or Logo
          if (isFirstPage)
            Row(
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: Image.asset(
                      'assets/images/app_icon.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.primaryOrange,
                          child: const Icon(
                            Icons.restaurant,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Mitho Deals',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            )
          else
            IconButton(
              onPressed: () {
                context.read<IntroductionBloc>().add(const IntroductionEvent.previousPage());
              },
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFF07C1F)),
            ),
          
          // Skip or Step indicator
          if (!isLastPage)
            TextButton(
              onPressed: () {
                context.read<IntroductionBloc>().add(const IntroductionEvent.skip());
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color:  const Color(0xFFF07C1F),
                  fontSize: 14,
                  fontWeight: isFirstPage ? FontWeight.normal : FontWeight.w500,
                ),
              ),
            )
          else
            const Text(
              '3 OF 3',
              style: TextStyle(
                color: Color(0xFFF07C1F),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
