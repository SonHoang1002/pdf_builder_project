import 'package:cv_1/models/contact_model.dart';
import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateContactEvent extends ContactEvent {
  final ContactModel contactModel;

  UpdateContactEvent(this.contactModel);
  @override
  List<Object?> get props => [];
}
