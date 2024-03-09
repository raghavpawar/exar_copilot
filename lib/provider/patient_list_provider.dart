import 'package:exar_copilot/model/patient_data.dart';
import 'package:flutter/cupertino.dart';

class PatientListProvider extends ChangeNotifier {
  List<Patient> patients = [
  Patient(name: 'John Doe', gender: 'Male', age: 30),
  Patient(name: 'Kenyon Fransisko', gender: 'Female', age: 25),
  Patient(name: 'Michale Robert', gender: 'Male', age: 24),
  Patient(name: 'Ishan Dubey', gender: 'Male', age: 23),
  Patient(name: 'Anushka Jain', gender: 'Female', age: 23),
  Patient(name: 'Ankit Gupta', gender: 'Male', age: 24),
  // Add more patients here...
];

  void addPatient(Patient patient) {
    patients.add(patient);
    notifyListeners();
  }
}
