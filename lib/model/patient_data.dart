class Patient {
  final String name;
  final String gender;
  final int age;

  Patient({required this.name, required this.gender, required this.age});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['firstName'],
      gender: json['gender'],
      age: json['age'],
    );
  }
}
