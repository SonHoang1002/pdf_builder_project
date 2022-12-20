import 'package:flutter/material.dart';

class ExperienceModel {
  TextEditingController work;
  TextEditingController job;
  TextEditingController period;
  TextEditingController desc;
  bool isOpen;
  DateTime startTime;
  DateTime endTime;

  ExperienceModel(
      {required this.work,
      required this.job,
      required this.period,
      required this.desc,
      required this.isOpen,required this.startTime,required this.endTime});
  @override
  String toString() {
    return "work: $work, job: $job, period: $period, dec: $desc,isOpen:$isOpen";
    // print("work: $work, job: $job, period: $period, dec: $desc,isOpen:$isOpen");
  }
}
