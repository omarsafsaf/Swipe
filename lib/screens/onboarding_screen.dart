import 'package:flutter/material.dart';
import 'splash_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set the background color to blue
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildPage(
                image: 'assets/your_image1.png',
                title: 'Send and Receive Payment',
                description: 'Pay for the necessities. Pay for fun.',
              ),
              _buildPage(
                image: 'assets/your_image2.png',
                title: 'Manage your privacy setting',
                description: 'Share with the world, or keep it to yourself.',
              ),
              _buildPage(
                image: 'assets/your_image3.png',
                title: 'No hidden fees',
                description: 'It costs nothing to send or receive money.',
              ),
              _buildPage(
                image: 'assets/your_image4.png',
                title: 'Pay in apps & online',
                description: 'Check out with Swipe, then share your finds with friends.',
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != 0)
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Back', style: TextStyle(color: Colors.white)),
                  ),
                Row(
                  children: List.generate(4, (index) => _buildDot(index, context)),
                ),
                if (_currentPage != 3)
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Next', style: TextStyle(color: Colors.white)),
                  ),
                if (_currentPage == 3)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    },
                    child: Text('Done'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({required String image, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Change text color to white
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white), // Change text color to white
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.grey, // Change selected dot color to white
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white), // Add a white border to dots
      ),
    );
  }
}
