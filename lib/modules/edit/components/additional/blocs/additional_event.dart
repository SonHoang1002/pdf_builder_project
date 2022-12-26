import 'package:cv_1/models/additional_model.dart';

abstract class AdditionalEvent {}

class UpdateAdditionalEvent extends AdditionalEvent {
  final AdditionalModel additionalModel;
  UpdateAdditionalEvent(this.additionalModel);
}
