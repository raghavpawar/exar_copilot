import 'package:exar_copilot/constants/constants.dart';
import 'package:exar_copilot/view/components/sub_components/patient_list_section.dart';
import 'package:exar_copilot/view/components/sub_components/add_patient_dialog.dart';
import 'package:exar_copilot/view/components/sub_components/custom_button.dart';
import 'package:exar_copilot/view/components/sub_components/custom_search_field.dart';
import 'package:exar_copilot/view/components/sub_components/doc_details_card.dart';
import 'package:flutter/material.dart';

class LeftContainer extends StatefulWidget {
  const LeftContainer({super.key});

  @override
  State<LeftContainer> createState() => _LeftContainerState();
}

class _LeftContainerState extends State<LeftContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Outside Container
      width: screenWidth! / 5.5, //262
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          screenWidth! / 72, //20
        ),
      ),
      margin: EdgeInsets.only(right: screenWidth! / 60), //24
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // Inside Container
            height: screenHeight! / 1.15, //850
            width: screenWidth! / 5.5, //262
            margin: EdgeInsets.fromLTRB(
              screenWidth! / 288, //5
              screenWidth! / 288,
              screenWidth! / 288,
              screenWidth! / 72, //20
            ),
            padding: EdgeInsets.fromLTRB(
              screenWidth! / 130.9,
              screenWidth! / 84.706,
              screenWidth! / 110.77,
              screenWidth! / 120,
            ),
            decoration: BoxDecoration(
              color: scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(
                screenWidth! / 102.857, //14
              ),
            ),
            child: Column(
              children: [
                CustomButton(
                  width: screenWidth! / 11.07,
                  height: screenWidth! / 40,
                  borderRadius: screenWidth! / 144,
                  hasBorderSide: true,
                  onPressed: () {
                    // Add Patient
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddPatientDialog();
                      },
                    );
                  },
                  children: [
                    const Icon(Icons.add, color: primaryColor),
                    Text(
                      'Add Patient',
                      style: textTheme.bodySmall!.copyWith(color: primaryColor),
                    ),
                  ],
                ),
                const CustomSearchField(),
                // const SearchBar(),
                const PatientList(),
              ],
            ),
          ),
          const DocDetailsCard(),
        ],
      ),
    );
  }
}
