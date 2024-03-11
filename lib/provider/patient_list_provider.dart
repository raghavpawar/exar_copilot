import 'dart:convert';

import 'package:exar_copilot/model/patient_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PatientListProvider extends ChangeNotifier {

  List<Patient> newPatients = [];

  void addPatient(Patient patient) {
    newPatients.add(patient);
    notifyListeners();
  }

  Future<void> fetchPatientsList() async {
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
      notifyListeners();
    } else if (response.statusCode >= 500) {
      throw Exception('server');
    } else {
      throw Exception('error!!!!');
    }
  }
}
