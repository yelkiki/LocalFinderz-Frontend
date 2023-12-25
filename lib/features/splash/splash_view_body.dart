

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:local_finderzzz/features/onBoarding/on_boarding.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:page_transition/page_transition.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: AnimatedSplashScreen(
        splash: Image.asset("assets/images/localfinderz-high-resolution-logo-white-transparent.png"),
        backgroundColor: Colors.black,
        splashIconSize: SizeConfig.defaultSize! * 15,
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: OnBoardingView(),
        animationDuration: Duration(seconds: 1),

      ),
    );
  }
}