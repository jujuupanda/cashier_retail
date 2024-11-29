import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routes/route_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToMain();
    super.initState();
  }

  goToMain() {
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      context.goNamed(RouteName().homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "SPLASH SCREEN",
          style: GoogleFonts.openSans(fontSize: 24),
        ),
      ),
    );
  }
}
