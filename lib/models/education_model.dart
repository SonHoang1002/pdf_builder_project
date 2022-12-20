import 'package:flutter/cupertino.dart';

class EducationModel {
  TextEditingController university;
  TextEditingController degree;
  TextEditingController grad;
  TextEditingController achie;
  DateTime startTime;
  DateTime endTime;
  bool isOpen;

  EducationModel(
      {required this.university,
      required this.degree,
      required this.grad,
      required this.achie,
      required this.isOpen,
      required this.startTime,
      required this.endTime});
}
