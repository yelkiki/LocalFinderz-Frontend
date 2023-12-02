// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:local_finderzzz/features/onBoarding/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody(),
    );
  }
}