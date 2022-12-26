import 'package:cv_1/modules/edit/components/education/blocs/education_event.dart';
import 'package:cv_1/modules/edit/components/education/blocs/education_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(InitEducation()) {
    on<UpdateEducationEvent>((event, emit) {
      emit(SetEducation(event.model));
      print("call UpdateEduccation");
    });
  }
}
