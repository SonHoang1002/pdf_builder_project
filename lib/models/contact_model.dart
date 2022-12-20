import 'package:flutter/cupertino.dart';

class ContactModel {
  TextEditingController phone;
  TextEditingController email;
  TextEditingController address;

  ContactModel(
      {required this.phone, required this.email, required this.address});
}
