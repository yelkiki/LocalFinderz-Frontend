// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:video_player/video_player.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/onboarding.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      })
      ..setLooping(true) // Loop the video
      ..play(); // Auto-play the video
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){

            return Stack(
              children: [
          
                _controller.value.isInitialized
                ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
                : Container(),
              
              
                GestureDetector(                 
                  onTap: () {
                    _controller.pause();
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Align(
                    alignment: Alignment(0.w, 0.72.h),
                    child: Container(
                      height: SizeConfig.defaultSize! * 6,
                      width: SizeConfig.defaultSize! * 22,
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.w),
                        gradient: const LinearGradient(
                          colors: [
                            kMainColor,
                            thirdColor,
                          ]
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        )
                      
                      ),
                      child: Center(
                        child: Text(
                          "G e t   S t a r t e d !",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "blacklisted",
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }     
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose of the controller when the widget is disposed
  }
}


//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           // Get the screen width and height
//           double screenWidth = constraints.maxWidth;
//           double screenHeight = constraints.maxHeight;

//           // Calculate padding based on screen width and height
//           double paddingVertical = screenHeight * 0.1; // 10% of screen height
//           double paddingHorizontal = screenWidth * 0.1; // 10% of screen width

//           // Calculate the content width and height
//           double contentWidth = screenWidth - (2 * paddingHorizontal);
//           double contentHeight = screenHeight - (2 * paddingVertical);

//           return Center(
//             child: Container(
//               width: contentWidth ,
//               height: contentHeight,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black), // Border for visualization
//               ),
//               child: Center(
//                 child: Text(
//                   'Adaptive UI Example',
//                   style: TextStyle(fontSize: 20.0),
