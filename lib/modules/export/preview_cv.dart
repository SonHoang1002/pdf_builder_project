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
        pageTheme: pageTheme,
        // pageTheme: pw.PageTheme(),
        // pageFormat: PdfPageFormat.a4,
        // theme: pw.ThemeData(),
        build: (pw.Context context) => _getAny(format)),
  );
  return doc.save();
}

List<pw.Widget> _getAny(PdfPageFormat format) {
  return [
    pw.Partitions(
      children: [
        pw.Partition(
            width: 200,
            child: pw.Column(children: [
              pw.Center(
                child: pw.Container(
                  color: PdfColors.red,
                  height: 150,
                  width: 150,
                ),
              ),
              ContactPDFView1(height: 200, width: 200),
              SkillPDFView1(height: 200, width: 200),
              pw.Wrap(children: [
                additional.listLang.length == 0
                    ? pw.Container()
                    : buildLanguage1(additional, format.width),
                // certificate
                additional.listCerti.length == 0
                    ? pw.Container()
                    : buildCetificate1(additional, format.width),
                // achivement
                additional.listAchie.length == 0
                    ? pw.Container()
                    : buildAchivement1(additional, format.width),
              ])
              // AdditionalPDFView1()
            ])),
        pw.Partition(
            width: 292,
            child: pw.Column(children: [
              InformationPDFView1(height: format.height, width: format.width),
              ExperiencePDFView1(height: format.height, width: format.width),
              EducationPDFView1(height: format.height, width: format.width)
            ])),
      ],
    ),
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
  final bgShape = await rootBundle.loadString('assets/images/black_image.svg');
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
