import 'package:cv_1/modules/edit/components/additional/blocs/additional_event.dart';
import 'package:cv_1/modules/edit/components/additional/blocs/additional_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionalBloc extends Bloc<AdditionalEvent, AdditionalState> {
  AdditionalBloc() : super(InitAdditional()) {
    on<UpdateAdditionalEvent>((event, emit) {
      emit(SetAdditional(event.additionalModel));
      print("call UpdateAdditionalEvent");
    });
  }
}
