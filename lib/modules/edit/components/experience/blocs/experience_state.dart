import 'package:cv_1/models/experience_model.dart';
import 'package:flutter/cupertino.dart';

abstract class ExperienceState {
  final List<ExperienceModel> list;

  ExperienceState(this.list);
}

class InitExperience extends ExperienceState {
  InitExperience()
      : super([
          ExperienceModel(
              work: TextEditingController(text: "fsdfsd"),
              job: TextEditingController(text: "sdfsd"),
              period: TextEditingController(text: "sdfsd"),
              desc: TextEditingController(text: "sdfsdf"),
              isOpen: true,
              startTime: DateTime.now(),
              endTime: DateTime.now())
        ]);
}

class SetExperience extends ExperienceState {
  final List<ExperienceModel> list;
  SetExperience(this.list) : super(list);
}
