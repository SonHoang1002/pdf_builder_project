import 'package:cv_1/models/education_model.dart';

abstract class EducationEvent {}

class UpdateEducationEvent extends EducationEvent {
  final List<EducationModel> model;

  UpdateEducationEvent(this.model);
  
}
