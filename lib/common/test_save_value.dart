import 'package:flutter/cupertino.dart';

class TestSaveValue {
  static  String fullNameController = "";
  // TestSaveValue();
  setTestValue(String value) {
    fullNameController = value;
  }

  String get getTestValue => fullNameController;
}
