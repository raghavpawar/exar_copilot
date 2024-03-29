import 'package:exar_copilot/model/patient_data.dart';
import 'package:exar_copilot/provider/patient_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchFieldProvider extends ChangeNotifier {
  List<Patient> foundPatients = [];

  void setSearchField(String value, BuildContext context) {
    if (value.isEmpty) {
      final patientListProvider =
          Provider.of<PatientListProvider>(context, listen: false);
      final searchFieldProvider =
          Provider.of<SearchFieldProvider>(context, listen: false);
      searchFieldProvider.foundPatients =
          List.from(patientListProvider.newPatients);
    }
    notifyListeners();
  }

  void searchPatient(String value, BuildContext context) {
    foundPatients = Provider.of<PatientListProvider>(context, listen: false)
        .newPatients
        .where((element) => element.name.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }
}
