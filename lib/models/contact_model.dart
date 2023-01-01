import 'package:flutter/cupertino.dart';

class ContactModel {
  TextEditingController phone;
  TextEditingController email;
  TextEditingController address;

  ContactModel(
      {required this.phone, required this.email, required this.address});
}

class ContactTitle {
  final String phoneTitle;
  final String emailTitle;
  final String addressTitle;
  ContactTitle(this.addressTitle, this.emailTitle, this.phoneTitle);
}