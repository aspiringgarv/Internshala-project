import 'dart:async';
import 'package:flutter/material.dart';
import '../main.dart';

class Tsplashscreen extends StatefulWidget {
  const Tsplashscreen({super.key});

  @override
  State<Tsplashscreen> createState() => _TsplashscreenState();
}

class _TsplashscreenState extends State<Tsplashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      isFirstTime==true? Navigator.pushReplacementNamed(context, 'onboard'):Navigator.pushReplacementNamed(context, 'search');
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/Animation/Splash.gif'),),
          ),
        ),
      ),
    );
  }
}
