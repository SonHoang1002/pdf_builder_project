import 'dart:math';

import 'package:cv_1/models/contact_model.dart';
import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/modules/export/component/additional_pdf_view.dart';
import 'package:cv_1/modules/export/component/contact_pdf_view.dart';
import 'package:cv_1/modules/export/component/education_pdf_view.dart';
import 'package:cv_1/modules/export/component/experience_pdf_view.dart';
import 'package:cv_1/modules/export/component/information_pdf_view.dart';
import 'package:cv_1/modules/export/component/skill_pdf_view.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:cv_1/tests/constant.dart';
import 'package:cv_1/tests/test_dropdownlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'dart:async';

class PriviewCV extends StatefulWidget {
  const PriviewCV({super.key});

  @override
  State<PriviewCV> createState() => _PriviewCVState();
}

final AdditionalModel additional = AdditionalRepo().getAdditionalRepo;
final ContactModel contactModel = ContactRepo().getContactRepo;
final listExp = ExperienceRepo().getExperienceRepo;
final listEdu = EducationRepo().getEducationRepo;
final infomationModel = InformationRepo().getInformationRepo;
final summary = SummaryRepo().getSummaryRepo;
final listSkill = SkillRepo().getSkillRepo;

class _PriviewCVState extends State<PriviewCV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview")),
      body: PdfPreview(
        build: (format) {
          return generateResume1(PdfPageFormat(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ));
        },
      ),
    );
  }
}

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

Future<Uint8List> generateResume1(PdfPageFormat format) async {
  final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/profile.jpg')).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);
  print(format.height);
  print(format.width);

  doc.addPage(
    pw.MultiPage(
        pageTheme: pageTheme, build: (pw.Context context) => _getAny(format)),
  );

// doc.addPage(page)
  return doc.save();
}

List<pw.Widget> _getAny(PdfPageFormat format) {
  // final pageTheme = await _myPageTheme(format);
  return [
    // pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    //   pw.Container(
    //       color: PdfColors.red, height: setHeighForAvatar(), width: 150),
    //   ContactPDFView1(height: setHeighForContact(), width: format.width),
    // ]),
    // SkillPDFView1(height: setHeighForSkill(), width: format.width),
    // pw.Wrap(children: [
    //   additional.listLang.length == 0
    //       ? pw.Container()
    //       : pw.Container(
    //           // color: PdfColors.green,
    //           // height: setHeighAddtional(
    //           //     "Language", additional),
    //           child: buildLanguage1(additional, format.width)),
    //   // certificate
    //   additional.listCerti.length == 0
    //       ? pw.Container()
    //       : pw.Container(
    //           color: PdfColors.green,
    //           // height: setHeighAddtional(
    //           //     "Certificate", additional),
    //           child: buildCetificate1(additional, format.width)),
      pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: ConstantVar.listContent.map((e) {
            return e;
          }).toList())
      // achivement
      // additional.listAchie.length == 0
      //     ? pw.Container()
      //     : pw.Container(
      //         child: buildAchivement1(additional,format.width)),
    // ])
  ];
}
//  pw.Wrap(children: [
//           pw.Partitions(
//             children: [
//               pw.Partition(
//                   width: 200,
//                   // flex: 3,
//                   child: pw.Column(children: [
//                     // pw.Flexible(
//                     pw.Container(
//                       // height: pageTheme.pageFormat.availableHeight,
//                       padding: pw.EdgeInsets.fromLTRB(15, 10, 25, 0),
//                       color: PdfColors.black,
//                       child: pw.Column(
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           pw.Center(
//                             child: pw.Container(
//                                 color: PdfColors.red,
//                                 height: setHeighForAvatar(),
//                                 width: 150),
//                           ),
//                           // pw.Container(
//                           //   constraints: pw.BoxConstraints(minWidth: 120),
//                           //   child:
//                           pw.Wrap(children: [
//                             ContactPDFView1(
//                                 height: setHeighForContact(),
//                                 width: format.width),
//                           ]),
//                           // ),
//                           pw.Wrap(children: [
//                             SkillPDFView1(
//                                 height: setHeighForSkill(),
//                                 width: format.width),
//                           ]),
//                           pw.Wrap(children: [
//                             additional.listLang.length == 0
//                                 ? pw.Container()
//                                 : pw.Container(
//                                     // color: PdfColors.green,
//                                     // height: setHeighAddtional(
//                                     //     "Language", additional),
//                                     child: buildLanguage1(
//                                         additional, format.width)),
//                             // certificate
//                             additional.listCerti.length == 0
//                                 ? pw.Container()
//                                 : pw.Container(
//                                     color: PdfColors.green,
//                                     // height: setHeighAddtional(
//                                     //     "Certificate", additional),
//                                     child: buildCetificate1(
//                                         additional,
//                                         setHeighAddtional(
//                                             "Certificate", additional),
//                                         format.width)),
//                             // // achivement
//                             // additional.listAchie.length == 0
//                             //     ? pw.Container()
//                             //     : pw.Container(
//                             //         child: buildAchivement1(additional,setHeighAddtional("Achivement",additional),format.width)),
//                           ])
//                           // AdditionalPDFView1()
//                         ],
//                       ),
//                     ),
//                     // flex: 1)
//                   ])),
//               pw.Partition(
//                   width: 292,
//                   // flex: 8,
//                   child: pw.Column(children: [
//                     // pw.Flexible(
//                     pw.Container(
//                       // padding: pw.EdgeInsets.fromLTRB(10, 10, 5, 0),
//                       // height: pageTheme.pageFormat.availableHeight,
//                       color: PdfColors.black,
//                       child: pw.Column(
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           // pw.Container(
//                           // color: PdfColors.green, height: 200, width: 350),
//                           pw.Wrap(children: [
//                             InformationPDFView1(
//                                 height: format.height, width: format.width),
//                           ]),
//                           pw.Wrap(children: [
//                             ExperiencePDFView1(
//                                 height: format.height, width: format.width),
//                           ]),
//                           pw.Wrap(children: [
//                             EducationPDFView1(
//                                 height: format.height, width: format.width)
//                           ]),
//                         ],
//                       ),
//                     ),
//                     // flex: 2)
//                   ]))
//             ],
//           ),
//         ])

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/images/resume.svg');
  return pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}



double setHeighForAvatar() {
  return 150;
}

double setHeighForContact() {
  final ContactModel contactModel = ContactRepo().getContactRepo;
  final heightContactTitle = 30;
  final heightEmail = (contactModel.email.text.trim().length / 13).floor() * 20;
  final heightPhone = 30;
  final heightAddress =
      (contactModel.address.text.trim().length / 13).floor() * 20;
  return (heightContactTitle + heightAddress + heightPhone + heightPhone)
      .toDouble();
}

double setHeighForSkill() {
  final List<SkillModel> listSkill = SkillRepo().getSkillRepo;
  final heightSkillTitle = 10;
  final int numberOfSkillModel = listSkill.length;
  int numberOfSkillLine = 0;
  listSkill.forEach((element) {
    numberOfSkillLine += (element.skill.text.trim().length / 13).floor();
  });
  return (heightSkillTitle + (numberOfSkillLine + numberOfSkillModel) * 15)
      .toDouble();
}

double setHeighAddtional(String nameList, AdditionalModel additional) {
  int numberOfLine = 0;
  final heightSkillTitle = 30;
  if (nameList == "Language") {
    int numberOfLangModel = additional.listLang.length;
    additional.listLang.forEach((element) {
      if (element.language.text.trim().length +
              element.level.text.trim().length >
          15) {
        numberOfLine += 1;
      }
    });
    numberOfLine = numberOfLine + numberOfLangModel;
    return (numberOfLine * 30 + heightSkillTitle).toDouble();
  } else if (nameList == "Certificate") {
    return (additional.listCerti.length * 2 * 30 + heightSkillTitle).toDouble();
  }
  return (additional.listAchie.length * 2 * 15 + heightSkillTitle).toDouble();
}

checkTotalLine() {
  //contact max =27 lines
  final lineOfContactTitle = 1;
  final lineOfEmailContact =
      (contactModel.email.text.trim().length / 22).floor();
  final lineOfPhoneContact = 1;
  final lineOfAddressContact =
      (contactModel.address.text.trim().length / 20).floor();
  //language total  contact + language = 18 of content
  final lineOfLanguageTitle = 1;
  final lineOfLanguageContent = additional.listAchie.length;
  additional.listLang.forEach((element) {
    if (element.language.text.trim().length + element.level.text.trim().length >
        20) {
      lineOfLanguageContent + 1;
    }
  });
  // lineOfLanguageContent + lineOfAddressContact+lineOfPhoneContact+lineOfEmailContact <18;
  //Certificate
  final lineOfCertificateTitle = 1;
  final lineOfCertificateContent = additional.listCerti.length * 2;

  //Achivement cer + achie = 17 content
  final lineOfAchivementTitle = 1;
  final lineOfAchivementContent = additional.listAchie.length * 2;
  // lineOfAchivementContent+ lineOfCertificateContent <17
}
