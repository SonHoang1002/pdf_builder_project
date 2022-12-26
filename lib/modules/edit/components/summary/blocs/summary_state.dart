import 'package:cv_1/models/summary_model.dart';
import 'package:flutter/cupertino.dart';

abstract class SummaryState {
  final SummaryModel modelSummary;
  SummaryState(this.modelSummary);
}

class InitSummary extends SummaryState {
  InitSummary()
      : super(SummaryModel(
            summaryController: TextEditingController(text: "Init Summary")));
}

class SetSummary extends SummaryState {
  final SummaryModel summaryModel;
  SetSummary(this.summaryModel) : super(summaryModel);
}
