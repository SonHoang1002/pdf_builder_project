import 'package:cv_1/modules/edit/components/skill/blocs/skill_event.dart';
import 'package:cv_1/modules/edit/components/skill/blocs/skill_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  SkillBloc() : super(InitSkill()) {
    on<UpdateSkill>((event, emit) {
      emit(SetSkill(event.listSkill));
      print("call UpdateSkill");
    });
  }
}
