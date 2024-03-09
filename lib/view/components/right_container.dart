import 'package:exar_copilot/constants/constants.dart';
import 'package:exar_copilot/view/components/sub_components/custom_button.dart';
import 'package:exar_copilot/view/components/sub_components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RightContainer extends StatelessWidget {
  const RightContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenWidth! / 65.45), // 22
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: screenWidth! / 36,
                width: screenWidth! / 36,
                child: Image.asset('logo/exar_logo.png'),
              ),
              Text(
                'EXAR CoPilot',
                style: textTheme.displayMedium,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Audio Transcription',
                style: textTheme.displayLarge,
              ),
              SizedBox(
                height: screenHeight! / 42.04, //23
              ),
              const CustomTextField(),
              SizedBox(
                height: screenHeight! / 20.574, //47
              ),
              Text(
                'Doctor\'s note',
                style: textTheme.displayLarge,
              ),
              SizedBox(
                height: screenHeight! / 42.04, //23
              ),
              const CustomTextField(),
              SizedBox(
                height: screenHeight! / 64.46, //15
              ),
              SizedBox(
                width: screenWidth! / 1.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      width: screenWidth! / 4.737, //304
                      height: screenHeight! / 16.116, //60
                      borderRadius: screenWidth! / 120, //12
                      onPressed: () {},
                      children: [
                        Text('Record / Resume',
                            style: textTheme.displaySmall!
                                .copyWith(color: whiteColor)),
                        SizedBox(
                            width: screenWidth! / 60,
                            height: screenWidth! / 60,
                            child: SvgPicture.asset('icons/mic_icon.svg')),
                        SizedBox(
                            width: screenWidth! / 60,
                            height: screenWidth! / 60,
                            child:
                                SvgPicture.asset('icons/attach_file_icon.svg')),
                        SizedBox(
                            width: screenWidth! / 60,
                            height: screenWidth! / 60,
                            child: SvgPicture.asset('icons/send_icon.svg')),
                      ],
                    ),
                    CustomButton(
                      onPressed: () {
                        // Generate note
                      },
                      width: screenWidth! / 7.2, //200
                      height: screenHeight! / 16.116, //60
                      borderRadius: screenWidth! / 120, //12
                      children: [
                        Text('Generat~`e note',
                            style: textTheme.displaySmall!
                                .copyWith(color: whiteColor)),
                      ],
                    ),
                    CustomButton(
                      onPressed: () {},
                      width: screenWidth! / 7.46, //193
                      height: screenWidth! / 36, //40
                      borderRadius: screenWidth! / 144,
                      hasBorderSide: true,
                      children: [
                        Text('Doctor\'s note',
                            style: textTheme.bodyMedium!
                                .copyWith(color: primaryColor)),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                          size: screenWidth! / 60,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
