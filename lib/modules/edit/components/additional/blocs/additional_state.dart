import 'package:cv_1/models/additional_model.dart';
import 'package:flutter/material.dart';

abstract class AdditionalState {
  final AdditionalModel additionalModel;
  AdditionalState(this.additionalModel);
}

class InitAdditional extends AdditionalState {
  InitAdditional()
      : super(AdditionalModel([
          Language(TextEditingController(text: "Init Language"),
              TextEditingController(text: "Init Native")),
        ], [
          Certificate(TextEditingController(text: "Init Certification"),
              TextEditingController(text: "12/2022"), DateTime.now())
        ], [
          Achivement(TextEditingController(text: "Init Achievement"),
              TextEditingController(text: "12/2022"), DateTime.now())
        ], false, false, false));
}

class SetAdditional extends AdditionalState {
  final AdditionalModel additionalModel;

  SetAdditional(this.additionalModel) : super(additionalModel);
}
