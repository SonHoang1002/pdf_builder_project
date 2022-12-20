import 'package:flutter/material.dart';

class ConstantVariable {
  static const pathImg = "assets/images/";
  static const listOfImage = [
    "${pathImg}cv_img_1.jpg",
    "${pathImg}cv_img_2.png",
    "${pathImg}cv_img_3.jpg",
    "${pathImg}cv_img_4.jpg",
    "${pathImg}cv_img_5.png",
    "${pathImg}cv_img_2.png",
  ];

  static const topics = [
    "Info",
    "Contact",
    "Education",
    "Experience",
    "Skill",
    "Summary"
  ];

  static RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static List<String> examplesForSummary = [
    ''' 
    Innovative Product Manager with six years of experience launching excelent products that increase profits.
    A proven track record in design product roadmaps and formatlating cost-effective product strategies.
    Expert at establising solid workplace relationships and fostering teamwork.
  ''',
    ''' 
    Innovative Product Manager with six years of experience launching excelent products that increase profits.
    A proven track record in design product roadmaps and formatlating cost-effective product strategies.
    Expert at establising solid workplace relationships and fostering teamwork.
  ''',
    ''' 
    Innovative Product Manager with six years of experience launching excelent products that increase profits.
    A proven track record in design product roadmaps and formatlating cost-effective product strategies.
    Expert at establising solid workplace relationships and fostering teamwork.
  ''',
    ''' 
    Innovative Product Manager with six years of experience launching excelent products that increase profits.

  ''',
  ];
  static List<Color> colorOfExamples = [
    Colors.amber.shade200,
    Colors.green.shade200,
    Colors.pink.shade200,
    Colors.blue.shade200,
  ];
}
