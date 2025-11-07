import 'dart:async'; 
import 'package:flutter/material.dart'; 
import 'onboarding_screen.dart'; 
 
class SplashScreen extends StatefulWidget { 
  @override 
  _SplashScreenState createState() => _SplashScreenState(); 
} 
 
class _SplashScreenState extends State<SplashScreen> { 
  @override 
  void initState() { 
  super.initState(); 
 
    // Move to Onboarding after 3 seconds 
    Timer(Duration(seconds: 3), () { 
      Navigator.pushReplacement( 
        context, 
        MaterialPageRoute(builder: (context) => OnboardingScreen()), 
      ); 
    });
  }

   @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: const Color.fromARGB(255, 234, 241, 251), 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            // App logo or icon 
            Image.asset('images/chart.png', height: 250), 
            SizedBox(height: 50), 
            // Text( 
            //   "Bumurise", 
            //   style: TextStyle( 
            //     color: Colors.white, 
            //     fontSize: 24, 
            //     fontWeight: FontWeight.bold, 
            //   ), 
            // ), 
            SizedBox(height: 40), 
            CircularProgressIndicator(color: Colors.white), 
          ], 
        ), 
      ), 
    ); 
  } 
}