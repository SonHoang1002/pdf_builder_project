import 'dart:math';

import 'package:cv_1/modules/export/component/additional_pdf_view.dart';
import 'package:cv_1/modules/export/component/contact_pdf_view.dart';
import 'package:cv_1/modules/export/component/education_pdf_view.dart';
import 'package:cv_1/modules/export/component/experience_pdf_view.dart';
import 'package:cv_1/modules/export/component/information_pdf_view.dart';
import 'package:cv_1/modules/export/component/skill_pdf_view.dart';
import 'package:cv_1/repository/repository.dart';
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
      build: (pw.Context context) => [
        pw.Wrap(children: [
          pw.Partitions(
            children: [
              pw.Partition(
                  width: 200,

                  // flex: 3,
                  child: pw.Column(children: [
                    // pw.Flexible(
                    pw.Container(
                      height: pageTheme.pageFormat.availableHeight,
                      padding: pw.EdgeInsets.fromLTRB(15, 10, 25, 0),
                      color: PdfColors.black,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Center(
                            child: pw.Container(
                                color: PdfColors.red, height: 150, width: 150),
                          ),
                          // pw.Container(
                          //   constraints: pw.BoxConstraints(minWidth: 120),
                          //   child:
                          ContactPDFView1(
                              height: format.height, width: format.width),
                          // ),
                          SkillPDFView1(
                              height: format.height, width: format.width),
                          AdditionalPDFView1(
                              height: format.height, width: format.width)
                          // AdditionalPDFView1()
                        ],
                      ),
                    ),
                    // flex: 1)
                  ])),
              pw.Partition(
                  width:292,
                  // flex: 8,
                  child: pw.Column(children: [
                // pw.Flexible(
                pw.Container(
                  // padding: pw.EdgeInsets.fromLTRB(10, 10, 5, 0),
                  height: pageTheme.pageFormat.availableHeight,
                  color: PdfColors.black,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // pw.Container(
                      // color: PdfColors.green, height: 200, width: 350),
                      InformationPDFView1(
                          height: format.height, width: format.width),
                      ExperiencePDFView1(
                          height: format.height, width: format.width),
                      EducationPDFView1(
                          height: format.height, width: format.width)
                    ],
                  ),
                ),
                // flex: 2)
              ]))
            ],
          ),
        ])
      ],
    ),
  );

// doc.addPage(page)
  return doc.save();
}

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

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    this.icon,
  });

  final String title;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Lorem(length: 20),
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => green;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
