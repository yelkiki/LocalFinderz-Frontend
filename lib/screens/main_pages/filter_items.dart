import 'package:flutter/material.dart';
import 'package:local_finderzzz/utils/size_config.dart';

class FilterItems extends StatelessWidget {
  const FilterItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          color: Colors.green,
        ),
        Container(
          height: 30,
          color: Colors.blue,
        ),
        Container(
          height: 30,
          color: Colors.yellow,
        ),
      ],
    );
  }
}