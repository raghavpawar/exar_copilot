// ignore_for_file: prefer_const_constructors

import 'package:exar_copilot/constants/constants.dart';
import 'package:exar_copilot/model/patient_data.dart';
import 'package:exar_copilot/provider/patient_list_provider.dart';
import 'package:exar_copilot/provider/search_field_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPatientDialog extends StatefulWidget {
  const AddPatientDialog({
    super.key,
  });

  @override
  State<AddPatientDialog> createState() => _AddPatientDialogState();
}

class _AddPatientDialogState extends State<AddPatientDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Consumer<PatientListProvider>(
      builder: (context, patientListProvider, child) => Container(
        width: screenWidth! / 3.5, //400
        height: screenHeight! / 2.8, //400
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(screenWidth! / 90), //16
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Add Patient',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                String name = _nameController.text;
                String gender = _genderController.text;
                int age = int.tryParse(_ageController.text) ?? 0;
                if (!(name.isEmpty || gender.isEmpty || age == 0)) {
                  print('adding patient ');
                  patientListProvider.addPatient(
                    Patient(name: name, gender: gender, age: age),
                  );
                  print('1 ' + patientListProvider.patients.last.name);
                  final searchFieldProvider =
                      Provider.of<SearchFieldProvider>(context, listen: false);
                  print(searchFieldProvider.foundPatients.last.name);
                  searchFieldProvider.setSearchField('', context);
                  print('2 ' + searchFieldProvider.foundPatients.last.name);
                } else {
                  null;
                }

                (name.isEmpty || gender.isEmpty || age == 0)
                    ? null
                    : Navigator.of(context).pop();
              },
              style: Theme.of(context).textButtonTheme.style,
              child: Container(
                  height: screenHeight! / 20, //48
                  width: screenWidth! / 8, //100
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(screenWidth! / 96), //15
                  ),
                  child: Center(
                    child: Text(
                      'Add Patient',
                      style: textTheme.bodyLarge!.copyWith(color: whiteColor),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
