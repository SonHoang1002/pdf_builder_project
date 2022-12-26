import 'package:cv_1/models/skill_model.dart';
import 'package:flutter/cupertino.dart';

abstract class SkillState {
  final List<SkillModel> listSkill;
  SkillState(this.listSkill);
}

class InitSkill extends SkillState {
  InitSkill() : super([SkillModel(skill: TextEditingController(text: ""))]);
}

class SetSkill extends SkillState {
  final List<SkillModel> listSKill;
  SetSkill( this.listSKill):super(listSKill);
}
