// import 'package:exar_copilot/constants.dart';
import 'package:exar_copilot/constants/constants.dart';
import 'package:exar_copilot/view/components/left_container.dart';
import 'package:exar_copilot/view/components/right_container.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      margin: EdgeInsets.fromLTRB(
        screenWidth! / 180, // 8
        screenWidth! / 180,
        screenWidth! / 48, // 30
        screenWidth! / 180,
      ),
      child: const Row(
        children: [
          LeftContainer(),
          
          RightContainer(),
        ],
      ),
    ));
  }
}
