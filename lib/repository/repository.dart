
import 'dart:io';

import 'package:cv_1/models/export_all_models.dart';
import 'package:flutter/material.dart';

class InformationRepo {
  static InformationModel informationModel = InformationModel(
      fullName: TextEditingController(text: "init name"),
      jobTitle: TextEditingController(text: "init job"),
      date: TextEditingController(text: "init date"),
      listUrl: [TextEditingController(text: "init url")]);
  setInformationRepo(InformationModel _informationModel) {
    informationModel = _informationModel;
  }

  InformationModel get getInformationRepo => informationModel;
}

class ContactRepo {
  static ContactModel contactModel = ContactModel(
      phone: TextEditingController(text: ""),
      email: TextEditingController(text: ""),
      address: TextEditingController(text: ""));
  setContactRepo(ContactModel _ContactModel) {
    contactModel = _ContactModel;
  }

  ContactModel get getContactRepo => contactModel;
}

class EducationRepo {
  static List<EducationModel> listEdu = [
    EducationModel(
        university: TextEditingController(text: ""),
        degree: TextEditingController(text: ""),
        grad: TextEditingController(text: ""),
        achie: TextEditingController(text: ""),
        isOpen: true,
        startTime: DateTime.now(),
        endTime: DateTime.now())
  ];
  setEducationRepo(List<EducationModel> listEdu1) {
    listEdu = listEdu1;
  }

  List<EducationModel> get getEducationRepo => listEdu;
}

class ExperienceRepo {
  static List<ExperienceModel> listExp = [
    ExperienceModel(
        work: TextEditingController(text: "fsdfsd"),
        job: TextEditingController(text: "sdfsd"),
        period: TextEditingController(text: "sdfsd"),
        desc: TextEditingController(text: "sdfsdf"),
        isOpen: true,
        startTime: DateTime.now(),
        endTime: DateTime.now())
  ];
  setExperienceRepo(List<ExperienceModel> listExp1) {
    listExp = listExp1;
  }

  List<ExperienceModel> get getExperienceRepo => listExp;
}

class SkillRepo {
  static List<SkillModel> listSkill = [
    SkillModel(skill: TextEditingController(text: "init pdf skill"))
  ];
  setSkillRepo(List<SkillModel> listSkill1) {
    listSkill = listSkill1;
  }

  List<SkillModel> get getSkillRepo => listSkill;
}

class SummaryRepo {
  static SummaryModel listSummary = SummaryModel(
      summaryController: TextEditingController(text: "init pdf summary"));
  setSummaryRepo(SummaryModel listSummary1) {
    listSummary = listSummary1;
  }

  SummaryModel get getSummaryRepo => listSummary;
}

class AdditionalRepo {
  static AdditionalModel listAdditional = AdditionalModel([
    Language(TextEditingController(text: "Init Language"),
        TextEditingController(text: "Init Native")),
  ], [
    Certificate(TextEditingController(text: "Init Certification"),
        TextEditingController(text: "12/2022"), DateTime.now())
  ], [
    Achivement(TextEditingController(text: "Init Achievement"),
        TextEditingController(text: "12/2022"), DateTime.now())
  ], false, false, false);
  setAdditionalRepo(AdditionalModel listAdditional1) {
    listAdditional = listAdditional1;
  }

  AdditionalModel get getAdditionalRepo => listAdditional;
}

class ImageFileAvatarRepo {
  static File file = File("");
  setAvatarFile(File file1) => file = file1;
  File get getAvatarFile => file;
}

class NumberOfPdfTemplate {
  static int number = 0;
  static const int allNumberOfTemplate = 10;
  setNumberOfTemplate(int num) => number = num;
  int get getNumberOfTemplate => number;
}
