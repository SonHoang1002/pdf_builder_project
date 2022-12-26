import 'package:cv_1/models/experience_model.dart';

abstract class ExperienceEvent {}

class UpdateExperienceEvent extends ExperienceEvent {
  final List<ExperienceModel> list;

  UpdateExperienceEvent(this.list);
}
