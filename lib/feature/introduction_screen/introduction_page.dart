import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/main.dart';
import 'bloc/introduction_bloc.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroductionBloc(),
      child: const IntroductionView(),
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

  final List<Map<String, dynamic>> _introData = [
    {
      "title": "Save Food,",
      "highlight": "Save Money",
      "desc": "Authentic Nepali flavors at up to 70% off. Join the movement to end food waste.",
      "image": "assets/images/momos.png",
      "badge": "NEPAL'S #1 FOOD RESCUE",
      "showLogo": true,
    },
    {
      "title": "Support Local Vendors",
      "highlight": "",
      "desc": "Help your favorite bakeries and restaurants reduce waste while enjoying fresh treats at amazing prices.",
      "image": "assets/images/vendor.png",
      "badge": "",
      "showStep": "STEP 2 OF 3",
    },
    {
      "title": "Protect Our Peaks",
      "highlight": "",
      "desc": "Reducing food waste means a cleaner, greener Nepal. Your first rescue starts today.",
      "image": "assets/images/mountains.png",
      "badge": "",
      "showStepTop": "3 OF 3",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroductionBloc, IntroductionState>(
      listener: (context, state) {
        _pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        body: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),
              
              // Page Content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    context.read<IntroductionBloc>().add(PageChangedEvent(index));
                  },
                  itemCount: _introData.length,
                  itemBuilder: (context, index) => _buildPage(index),
                ),
              ),
              
              // Bottom Navigation
              _buildBottomNavigation(),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return BlocBuilder<IntroductionBloc, IntroductionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back arrow or Logo
              state.currentPage == 0
                  ? Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF07C1F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.restaurant,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Mitho',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                      ],
                    )
                  : state.currentPage == 1
                      ? Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<IntroductionBloc>().add(PreviousPageEvent());
                              },
                              icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
                            ),
                          ],
                        )
                      : IconButton(
                          onPressed: () {
                            context.read<IntroductionBloc>().add(PreviousPageEvent());
                          },
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
                        ),
              
              // Skip or Step indicator
              state.currentPage == 0
                  ? TextButton(
                      onPressed: () {
                        context.read<IntroductionBloc>().add(SkipIntroductionEvent());
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 16,
                        ),
                      ),
                    )
                  : state.currentPage == 1
                      ? TextButton(
                          onPressed: () {
                            context.read<IntroductionBloc>().add(SkipIntroductionEvent());
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Color(0xFFF07C1F),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : const Text(
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
      },
    );
  }

  Widget _buildPage(int index) {
    final data = _introData[index];
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          
          // Image Container
          Container(
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Placeholder for image
                  Container(
                    color: index == 0
                        ? const Color(0xFFE85D04)
                        : index == 1
                            ? const Color(0xFFF4A261)
                            : const Color(0xFF2A9D8F),
                    child: Center(
                      child: Icon(
                        index == 0
                            ? Icons.food_bank
                            : index == 1
                                ? Icons.store
                                : Icons.landscape,
                        size: 100,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  
                  // Badge
                  if (data['badge'].isNotEmpty)
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          data['badge'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Title
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: data['title'],
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                    height: 1.2,
                  ),
                ),
                if (data['highlight'].isNotEmpty)
                  TextSpan(
                    text: '\n${data['highlight']}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF07C1F),
                      height: 1.2,
                    ),
                  ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Description
          Text(
            data['desc'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
          
          const Spacer(),
          
          // Page Indicators
          _buildIndicators(),
          
          const SizedBox(height: 24),
          
          // Navigation Button
          _buildNavButton(),
          
          // Step indicator for page 2
          if (index == 1)
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'STEP 2 OF 3',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9CA3AF),
                  letterSpacing: 1,
                ),
              ),
            ),
            
          if (index != 1) const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildIndicators() {
    return BlocBuilder<IntroductionBloc, IntroductionState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _introData.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: state.currentPage == index ? 32 : 8,
              decoration: BoxDecoration(
                color: state.currentPage == index
                    ? const Color(0xFFF07C1F)
                    : const Color(0xFFD1D5DB),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavButton() {
    return BlocBuilder<IntroductionBloc, IntroductionState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              if (state.isLastPage) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MithoDeals()),
                );
              } else {
                context.read<IntroductionBloc>().add(NextPageEvent());
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF07C1F),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.isLastPage ? 'Get Started' : (state.currentPage == 1 ? 'Continue' : 'Next'),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (!state.isLastPage) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigation() {
    return BlocBuilder<IntroductionBloc, IntroductionState>(
      builder: (context, state) {
        return const SizedBox.shrink();
      },
    );
  }
}
