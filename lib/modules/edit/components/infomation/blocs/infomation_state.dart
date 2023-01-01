import 'package:cv_1/models/infomation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class InformationState  {
  final InformationModel informationModel;
  InformationState(this.informationModel);
}

class Init extends InformationState {
  Init()
      : super(InformationModel(
            fullName: TextEditingController(text: "init name"),
            jobTitle: TextEditingController(text: "init job"),
            date: TextEditingController(text: ""),
            listUrl: [TextEditingController(text: "init url")]));


}

class SetInformation extends InformationState {
  final InformationModel informationModel;
  SetInformation(this.informationModel) : super(informationModel);


}
// class CallState extends InformationState{
//   CallState():super(InformationModel(
//             fullName: TextEditingController(text: "init"),
//             jobTitle: TextEditingController(text: "init"),
//             date: TextEditingController(text: "init"),
//             listUrl: [TextEditingController(text: "new")]));

  
// }
