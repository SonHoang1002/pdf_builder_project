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

class EducationSchoolTitleCubit extends Cubit<List<String>> {
  EducationSchoolTitleCubit() : super(["University/School"]);
  void updateEducationSchoolEvent(List<String> value) => emit(value);
}

class EducationGraduationTitleCubit extends Cubit<List<String>> {
  EducationGraduationTitleCubit() : super(["Graduation Year"]);
  void updateEducationGraduationEvent(List<String> value) => emit(value);
}

class EducationAchivementTitleCubit extends Cubit<List<String>> {
  EducationAchivementTitleCubit() : super(["Achivement(Optinal)"]);
  void updateEducationAchivementEvent(List<String> value) => emit(value);
}


