import 'dart:convert';

import 'package:exar_copilot/model/patient_data.dart';
import 'package:exar_copilot/provider/search_field_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PatientListProvider extends ChangeNotifier {

  List<Patient> newPatients = [];

  void addPatient(Patient patient) {
    newPatients.add(patient);
    notifyListeners();
  }

  Future<void> fetchPatientsList(BuildContext context) async {
    var response = await http.get(
      Uri.https('dummyjson.com', '/users'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var patientsList = data['users'] as List;
      var patientsIterable = patientsList.map<Patient>(
        (json) {
          return Patient.fromJson(json);
        },
      );
      for (var element in patientsIterable) {
        newPatients.add(element);
      }
      Provider.of<SearchFieldProvider>(context, listen: false)
          .foundPatients = List.from(newPatients);
      notifyListeners();
    } else if (response.statusCode >= 500) {
      throw Exception('server');
    } else {
      throw Exception('error!!!!');
    }
  }
}
