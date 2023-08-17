import 'package:flutter/material.dart';
import 'package:project/auth/loginScreen.dart';
import 'package:project/auth/registerScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<onBoardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPage({required String title, required String image}) =>
      Container(
        color: Color.fromARGB(255, 11, 201, 157),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }


  void _navigateToNextPage() {
    if (_currentPageIndex < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 1);
          },
          children: [
            _buildPage(
              title: 'Welcome',
              image: 'assets/images/restaurant.png',
            ),
            _buildPage(
              title:
                  'Are you ready for a dining experience unlike any other? Look no further than our restaurant! Our menu features a fusion of flavors that will take your taste buds on a journey around the world, with dishes inspired by the cuisines of Asia, Europe, and beyond.',
              image: 'assets/images/pasta.png',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                primary: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: Size.fromHeight(80),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text('Skip'),
                    onPressed: () {
                      Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => loginScreen()),
                      );
                    },
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 2,
                    effect: WormEffect(
                      spacing: 16,
                      dotColor: Colors.black26,
                      activeDotColor: Colors.teal.shade700,
                    ),
                    onDotClicked: (index) => _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                  ),
                  TextButton(
                    child: Text('Next'),
                    onPressed: _navigateToNextPage,
                  ),
                ],
              ),
            ),
    );
  }
}
