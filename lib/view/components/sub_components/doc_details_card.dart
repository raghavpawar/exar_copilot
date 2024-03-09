import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class DocDetailsCard extends StatelessWidget {
  const DocDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Bottom Container
      margin: EdgeInsets.fromLTRB(
        screenWidth! / 90, //16
        0,
        screenWidth! / 90,
        screenWidth! / 90,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/doc_image.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Gaurav',
                style: textTheme.bodyLarge!.copyWith(
                  color: blackColor,
                ),
              ),
              Text('gaurav@exar.fit',
                  style: textTheme.bodySmall!.copyWith(
                    color: const Color(0xFF8B91A2),
                  )),
            ],
          ),
          const Icon(Icons.keyboard_arrow_down_sharp),
        ],
      ),
    );
  }
}
