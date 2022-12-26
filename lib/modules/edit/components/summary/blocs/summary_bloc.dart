import 'package:cv_1/modules/edit/components/summary/blocs/summary_event.dart';
import 'package:cv_1/modules/edit/components/summary/blocs/summary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryBloc() : super(InitSummary()) {
    on<UpdateSummaryEvent>((event, emit) {
      emit(SetSummary(event.summaryModel));
      print("call UpdateSummary");
    });
  }
}
