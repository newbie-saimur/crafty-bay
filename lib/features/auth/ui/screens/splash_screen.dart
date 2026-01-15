import 'package:crafty_bay/features/auth/ui/screens/register_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static final String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  Future<void> _navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, RegisterScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                AppLogo(),
                Spacer(),
                CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text("Version 1.0.0", style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
