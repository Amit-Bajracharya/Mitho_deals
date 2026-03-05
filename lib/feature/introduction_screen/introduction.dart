import 'package:flutter/material.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _introData = [
    {
      "title": "Welcome to App",
      "desc": "Discover amazing features to boost your productivity.",
      "icon": "🚀"
    },
    {
      "title": "Stay Organized",
      "desc": "Keep all your tasks and schedules in one safe place.",
      "icon": "📅"
    },
    {
      "title": "Get Started",
      "desc": "Join our community and start your journey today!",
      "icon": "✅"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. The Swippable Content
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _introData.length,
            itemBuilder: (context, index) => _buildPage(index),
          ),

          // 2. Bottom Controls (Indicators & Button)
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Indicators
                Row(
                  children: List.generate(
                    _introData.length,
                    (index) => _buildIndicator(index == _currentPage),
                  ),
                ),
                // Next/Done Button
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _introData.length - 1) {
                      // TODO: Navigate to Home/Login using RouteConstants
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(_currentPage == 2 ? "GET STARTED" : "NEXT"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_introData[index]['icon']!, style: const TextStyle(fontSize: 100)),
          const SizedBox(height: 40),
          Text(
            _introData[index]['title']!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            _introData[index]['desc']!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}