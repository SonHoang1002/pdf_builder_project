import 'package:cv_1/models/contact_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ContactState  {
  final ContactModel contactModel;

  ContactState(this.contactModel);

}

class InitContact extends ContactState {
  InitContact()
      : super(ContactModel(
            phone: TextEditingController(text: ""),
            email: TextEditingController(text: ""),
            address: TextEditingController(text: "")));
            
}

class SetContact extends ContactState {
  final ContactModel contactModel;
  SetContact(this.contactModel)
      : super(contactModel);
}
