import 'package:exar_copilot/constants/constants.dart';
import 'package:exar_copilot/provider/patient_list_provider.dart';
import 'package:exar_copilot/provider/search_field_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  bool isPressed = false;
  int btnIndex = 0;

  @override
  void initState() {
    super.initState();
    final patientListProvider =
        Provider.of<PatientListProvider>(context, listen: false);
    final searchFieldProvider =
        Provider.of<SearchFieldProvider>(context, listen: false);
    searchFieldProvider.foundPatients = List.from(patientListProvider.patients);
  }

  void btnPressed(int index) {
    setState(
      () {
        if (isPressed) {
          if (btnIndex == index) {
            isPressed = false;
          } else {
            btnIndex = index;
          }
        } else {
          isPressed = true;
          btnIndex = index;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchFieldProvider>(
      builder: (context, searchFieldProvider, child) =>
          Consumer<PatientListProvider>(
        builder: (context, patientListProvider, child) {
          final foundPatients = searchFieldProvider.foundPatients;
          return Container(
            width: screenWidth! / 5.5, //262
            height: screenHeight! / 1.45, //800
            margin: EdgeInsets.only(top: screenWidth! / 96), //15
            child: ListView.builder(
              itemCount: foundPatients.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () => btnPressed(index),
                  style: Theme.of(context).textButtonTheme.style,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: screenWidth! / 96), //15
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth! / 72, //20
                          vertical: screenWidth! / 240, //6
                        ),
                        decoration: (isPressed && btnIndex == index)
                            ? BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(
                                    screenWidth! / 240), //6
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foundPatients[index].name,
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: (isPressed && btnIndex == index)
                                        ? whiteColor
                                        : blackColor,
                                  ),
                                ),
                                Text(
                                  '${foundPatients[index].gender}, ${foundPatients[index].age} Years',
                                  style: textTheme.labelLarge!.copyWith(
                                    color: (isPressed && btnIndex == index)
                                        ? whiteColor
                                        : primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            (isPressed && btnIndex == index)
                                ? Icon(
                                    Icons.arrow_forward_ios,
                                    color: whiteColor,
                                    size: screenWidth! / 72,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      !(isPressed && btnIndex == index)
                          ? const Divider(
                              color: primaryColor,
                              thickness: 1,
                            )
                          : Container(),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
