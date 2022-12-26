import 'package:cv_1/models/education_model.dart';
import 'package:flutter/cupertino.dart';

abstract class EducationState {
  final List<EducationModel> model;

  EducationState(this.model);
}

class InitEducation extends EducationState {
  InitEducation()
      : super([EducationModel(
            university: TextEditingController(text: ""),
            degree: TextEditingController(text: ""),
            grad: TextEditingController(text: ""),
            achie: TextEditingController(text: ""),
            isOpen: true,
            startTime: DateTime.now(),
            endTime: DateTime.now())]);
}

class SetEducation extends EducationState {
  final List<EducationModel> model;
  SetEducation(this.model):super(model);
}
