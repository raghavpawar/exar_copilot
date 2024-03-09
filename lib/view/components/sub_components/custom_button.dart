import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.children,
    required this.borderRadius,
    this.hasBorderSide = false,
    required this.onPressed,
  });

  final double width;
  final double height;
  final List<Widget> children;
  final double borderRadius;
  final bool hasBorderSide;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: Theme.of(context).textButtonTheme.style!.copyWith(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: hasBorderSide
                    ? const BorderSide(width: 1, color: primaryColor)
                    : BorderSide.none,
              ),
            ),
          ),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: hasBorderSide ? Colors.transparent : primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: hasBorderSide
                ? const BorderSide(width: 1, color: primaryColor)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      ),
    );
  }
}
