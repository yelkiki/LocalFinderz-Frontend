
import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
   
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;
  }
}

////////////////////////////////////////////////////////////////////////


// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Adaptive UI'),
//       ),
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
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
