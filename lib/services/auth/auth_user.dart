// Firebase
import 'package:cloud_firestore/cloud_firestore.dart';
// Constants
import 'auth_constants.dart';

class AuthUser {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String userName;
  final String description;
  final String displayImage;
  final double hoursWorked;
  final List<String> opportunities;
  final List<String> attended;

  const AuthUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.description,
    required this.displayImage,
    required this.hoursWorked,
    required this.opportunities,
    required this.attended,
  });

  factory AuthUser.fromFirebase(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final id = snapshot.id;
    final data = snapshot.data();
    final List<dynamic> opportunities = data[opportunitiesField];

    return AuthUser(
      id: id,
      email: data[emailField],
      firstName: data[firstNameField],
      lastName: data[lastNameField],
      userName: data[userNameField],
      description: data[descriptionField],
      displayImage: data[displayImageField],
      hoursWorked: data[hoursWorkedField] == 0 ? 0.0 : data[hoursWorkedField],
      opportunities: opportunities.map((o) => o.toString()).toList(),
      attended: (data[attendedField] as List).map((a) => a.toString()).toList(),
    );
  }
}
