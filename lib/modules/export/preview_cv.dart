import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cv_1/models/contact_model.dart';
import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/modules/export/component/additional_pdf_view.dart';
import 'package:cv_1/modules/export/component/contact_pdf_view.dart';
import 'package:cv_1/modules/export/component/education_pdf_view.dart';
import 'package:cv_1/modules/export/component/experience_pdf_view.dart';
import 'package:cv_1/modules/export/component/information_pdf_view.dart';
import 'package:cv_1/modules/export/component/skill_pdf_view.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class PriviewCV extends StatefulWidget {
  const PriviewCV({Key? key}) : super(key: key);

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
    print("number of certi: ${additional.listCerti.length}");
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
  final url =
      (await rootBundle.load('assets/images/profile.jpg')).buffer.asUint8List();

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
        build: (pw.Context context) => _getPdfView1(url)),
  );
  return doc.save();
}

List<pw.Widget> _getPdfView1(Uint8List url) {
  final file = ImageFileAvatarRepo().getAvatarFile;
  return [
    pw.Partitions(
      children: [
        pw.Partition(
            width: 200,
            child: pw.Column(children: [
              pw.Container(
                // color: PdfColors.red,
                child: pw.Row(
                    // color: PdfColors.red,
                    children: [
                      pw.Container(
                        width: 150,
                        height: 150,
                        color: PdfColors.red,
                        child: file.path == ""
                            ? pw.Image(pw.MemoryImage(url))
                            : pw.Image(
                                pw.MemoryImage(
                                    File(file.path).readAsBytesSync()),
                                fit: pw.BoxFit.cover,
                              ),
                      ),
                    ]),
              ),
              ContactPDFView1(),
              SkillPDFView1(),
              pw.Wrap(children: [
                additional.listLang.length == 0
                    ? pw.Container()
                    : buildLanguage1(additional),
                // certificate
                additional.listCerti.length == 0
                    ? pw.Container()
                    : buildCetificate1(additional),
                // achivement
                additional.listAchie.length == 0
                    ? pw.Container()
                    : buildAchivement1(additional),
              ])
              // AdditionalPDFView1()
            ])),
        pw.Partition(
            width: 292,
            child: pw.Column(children: [
              InformationPDFView1(),
              ExperiencePDFView1(),
              EducationPDFView1()
            ])),
      ],
    ),
  ];
}

List<pw.Widget> _getPdfView2(PdfPageFormat format, Uint8List url) {
  final file = ImageFileAvatarRepo().getAvatarFile;
  return [
    pw.Partitions(
      children: [
        pw.Partition(
            width: 200,
            child: pw.Column(children: [
              pw.Center(
                // child: pw.ClipOval(
                child: pw.Container(
                  width: 150,
                  height: 150,
                  color: PdfColors.red,
                  child: file.path == ""
                      ? pw.Image(pw.MemoryImage(url))
                      : pw.Image(
                          pw.MemoryImage(File(file.path).readAsBytesSync()),
                          fit: pw.BoxFit.cover,
                        ),
                ),
                // ),
              ),
              InformationPDFView1(),
              ContactPDFView1(),
              SkillPDFView1(),
              pw.Wrap(children: [
                additional.listLang.length == 0
                    ? pw.Container()
                    : buildLanguage1(additional),
                // certificate
                additional.listCerti.length == 0
                    ? pw.Container()
                    : buildCetificate1(additional),
                // achivement
                additional.listAchie.length == 0
                    ? pw.Container()
                    : buildAchivement1(additional),
              ])
              // AdditionalPDFView1()
            ])),
        pw.Partition(
            width: 292,
            child: pw.Column(
                children: [ExperiencePDFView1(), EducationPDFView1()])),
      ],
    ),
  ];
}

List<pw.Widget> _getPdfView3(PdfPageFormat format, Uint8List url) {
  final file = ImageFileAvatarRepo().getAvatarFile;
  return [
    pw.Center(
      // child: pw.ClipOval(
      child: pw.Container(
        width: 150,
        height: 150,
        color: PdfColors.red,
        child: file.path == ""
            ? pw.Image(pw.MemoryImage(url))
            : pw.ClipOval(
                child: pw.Image(
                pw.MemoryImage(File(file.path).readAsBytesSync()),
                fit: pw.BoxFit.cover,
              )),
      ),
      // ),
    ),
    pw.Center(
      child: InformationPDFView3(),
    ),
    pw.Partitions(
      children: [
        pw.Partition(
            width: 250,
            child: pw.Column(children: [
              ContactPDFView3(),
              SkillPDFView3(),
              pw.Wrap(children: [
                additional.listLang.length == 0
                    ? pw.Container()
                    : buildLanguage3(additional),
                // certificate
                additional.listCerti.length == 0
                    ? pw.Container()
                    : buildCetificate3(additional),
                // achivement
                additional.listAchie.length == 0
                    ? pw.Container()
                    : buildAchivement3(additional),
              ])
              // AdditionalPDFView1()
            ])),
        pw.Partition(
            width: 250,
            child: pw.Column(children: [
              pw.SizedBox(height: 15),
              ExperiencePDFView3(),
              EducationPDFView3()
            ])),
      ],
    ),
  ];
}

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
