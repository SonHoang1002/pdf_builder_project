import 'package:cv_1/modules/edit/components/experience/blocs/experience_event.dart';
import 'package:cv_1/modules/edit/components/experience/blocs/experience_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  ExperienceBloc() : super(InitExperience()) {
    on<UpdateExperienceEvent>((event, emit) {
      emit(SetExperience(event.list));
      print("call UpdateExperience");
    });
  }
}
