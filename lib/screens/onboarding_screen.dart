import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  final List<Map<String, String>> onboardingPages = [
    {
      "image": "images/hear2.png",
      "title": "Welcome to HearMe App",
      "description": "Get a mentor and connect with someone to talk to."
    },
    {
      "image": "images/heakl2.png",
      "title": "Find Someone to Talk To",
      "description": "Get advice from well-known mentors."
    },
    {
      "image": "images/stressqw.png",
      "title": "Feeling Stressed or Need Someone To Talk To?",
      "description": "Hear Me is here to listen and support you."
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: PageView.builder(
          controller: _controller,
          itemCount: onboardingPages.length,
          onPageChanged: (index) => setState(() => isLastPage = index == onboardingPages.length - 1),
          itemBuilder: (context, index) {
            final page = onboardingPages[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(page['image']!, height: 300),
                const SizedBox(height: 30),
                Text(
                  page['title']!,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  page['description']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: goToLogin,
              child: Container(
                width: double.infinity,
                height: 60,
                color: const Color.fromARGB(255, 58, 108, 183),
                alignment: Alignment.center,
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          : Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('Skip'),
                    onPressed: goToLogin, // skip straight to login
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: const Text('Next'),
                        onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
