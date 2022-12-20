import 'package:flutter/cupertino.dart';

class AdditionalModel {
  List<Language> listLang;
  List<Certificate> listCerti;
  List<Achivement> listAchie;
  bool langOpen;
  bool certiOpen;
  bool achieOpen;
  AdditionalModel(this.listLang, this.listCerti, this.listAchie,this.achieOpen,this.certiOpen,this.langOpen);
}

class Language {
  TextEditingController language;
  TextEditingController level;
  Language(this.language, this.level);
}

class Certificate {
  TextEditingController nameCertiController;
  TextEditingController dateCertiController;
  DateTime date;
  Certificate(this.nameCertiController, this.dateCertiController, this.date);
}

class Achivement {
  TextEditingController nameAchieController;
  TextEditingController dateAchieController;
  DateTime dateAchie;
  Achivement(
      this.nameAchieController, this.dateAchieController, this.dateAchie);
}
