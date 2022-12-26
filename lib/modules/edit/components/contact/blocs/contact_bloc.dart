import 'package:cv_1/modules/edit/components/contact/blocs/contact_event.dart';
import 'package:cv_1/modules/edit/components/contact/blocs/contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(InitContact()) {
    on<UpdateContactEvent>((event, emit) {
      emit(SetContact(event.contactModel));
      print("call ContactEvent");
    });
  }
}
