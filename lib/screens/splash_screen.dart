import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getIsLogin();
  }

  void getIsLogin() {
    Timer(const Duration(seconds: 10), () {
      debugPrint("Navigating to login...");
      if (mounted) {
        Navigator.popAndPushNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ensure the image loads properly
              Image.asset(
                'assets/assets/images/literexia.png', // Correct path
                width: 200.w, // Adjust size if needed
                height: 200.h,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Image not found', style: TextStyle(color: Colors.red));
                },
              ),
              SizedBox(height: 50.h), // Space below image
              
              // Loading Indicator with default color for testing
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
