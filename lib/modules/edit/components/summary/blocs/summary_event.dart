import 'package:cv_1/models/summary_model.dart';

abstract class SummaryEvent {}

class UpdateSummaryEvent extends SummaryEvent {
  final SummaryModel summaryModel;
  UpdateSummaryEvent(this.summaryModel);
}
