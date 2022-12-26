import 'package:cv_1/models/infomation_model.dart';
import 'package:equatable/equatable.dart';

abstract class InformationEvent  {
}

class UpdateInformationEvent extends InformationEvent {
  final InformationModel informationModel;

  UpdateInformationEvent(this.informationModel);
  
}


