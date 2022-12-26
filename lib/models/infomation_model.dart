
import 'package:flutter/material.dart';


class InformationModel {
  final TextEditingController fullName;
  final TextEditingController jobTitle;
  final TextEditingController date;
  final List<TextEditingController> listUrl;
  InformationModel(
      {required this.fullName,
      required this.jobTitle,
      required this.date,
      required this.listUrl});
}