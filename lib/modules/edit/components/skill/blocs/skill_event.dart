import 'package:cv_1/models/skill_model.dart';

abstract class SkillEvent {}

class UpdateSkill extends SkillEvent {
  final List<SkillModel> listSkill;
  UpdateSkill(this.listSkill) : super();
}
