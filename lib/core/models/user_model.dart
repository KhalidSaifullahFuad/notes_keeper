import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String password;
  DateTime? createdDate;
  DateTime updatedDate;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.createdDate,
    required this.updatedDate,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      id: snapshot.id,
      name: data['name'],
      email: data['email'],
      password: data['password'],
      createdDate: data['createdDate']?.toDate(),
      updatedDate: data['updatedDate'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'createdDate': createdDate ?? FieldValue.serverTimestamp(),
      'updatedDate': FieldValue.serverTimestamp(),
    };
  }
}