// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_finderzzz/features/onBoarding/on_boarding.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with TickerProviderStateMixin {
  AnimationController? animationController;

  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 6));

    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _controller.repeat();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context,_) {
          return Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              color: Colors.black
              // gradient: LinearGradient(
              //   colors: const [
              //     kMainColor,
              //     thirdColor
              //   ],
              //   begin: _topAlignmentAnimation.value,
              //   end: _bottomAlignmentAnimation.value,
              // ),
            ),
            child: Center(
              child: Container(
                height: SizeConfig.defaultSize! * 23,
                width: SizeConfig.defaultSize! * 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/localfinderz-high-resolution-logo-white-transparent.png"),
                    fit: BoxFit.fitWidth,
                  ),
                  color: Colors.transparent,
                  // borderRadius: BorderRadius.circular(15.w),
                ),
                                        
              ),
            ),
          );
        },       
      ),
    );
  }

  void goToNextView() {
    Future.delayed (
      Duration(seconds: 3), () {
        Get.to(
          () => OnBoardingView(),
          transition: Transition.rightToLeftWithFade,
          duration: Duration(seconds: 1) 
        );
      }
    );
  }
}