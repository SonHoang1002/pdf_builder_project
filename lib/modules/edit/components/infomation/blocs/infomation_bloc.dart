

import 'package:cv_1/models/infomation_model.dart';
import 'package:cv_1/modules/edit/components/infomation/blocs/infomation_event.dart';
import 'package:cv_1/modules/edit/components/infomation/blocs/infomation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc() : super(Init()) {
    on<UpdateInformationEvent>((event, emit) {
      print("call UpdateInformationEvent");
      emit(SetInformation(event.informationModel));
    });
    print("not call UpdateInformationEvent");
  }
}

class ImageFile {
  final String pathFile;
  ImageFile(this.pathFile);
}

class ImageAvatarCubit extends Cubit<ImageFile> {
  ImageAvatarCubit() : super(ImageFile(""));
  void setPathImage(String path) => emit(ImageFile(path));
}
