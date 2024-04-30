import 'package:flutter/material.dart';

class UserData {
  final int id;
  final String name;
  final String email;

  UserData({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
