import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class AdditionalPDFView1 extends pw.StatelessWidget {
  final double height;
  final double width;
  AdditionalPDFView1({required this.height, required this.width});
  final AdditionalModel additional = AdditionalRepo().getAdditionalRepo;
  @override
  pw.Widget build(pw.Context context) {
    return
        // pw.Container(
        // height: 300,
        // decoration: pw.BoxDecoration(
        // color: PdfColors.green,
        //     border: pw.Border.all(color: PdfColors.blue, width: 5)),

        // margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 20),
        // child:
        pw.Column(children: [
      //language
      // additional.listLang.length == 0
      //     ? pw.Container()
      //     : pw.Container(child: buildLanguage1()),
      // // certificate
      // additional.listCerti.length == 0
      //     ? pw.Container()
      //     : pw.Container(child: buildCetificate1()),
      // // achivement
      // additional.listAchie.length == 0
      //     ? pw.Container()
      //     : pw.Container(child: buildAchivement1()),
    ]);
    // );
  }
}

pw.Widget buildLanguage1(AdditionalModel additional, double width) {
  return pw.Column(children: [
    pw.Container(
      // height: height,
      color: PdfColors.yellow,
      margin: pw.EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: pw.Row(children: [
        pw.Container(
            height: 20,
            width: 20,
            decoration: pw.BoxDecoration(
                color: PdfColors.black,
                border: pw.Border.all(color: PdfColors.blue, width: 5),
                borderRadius: pw.BorderRadius.all(pw.Radius.circular(10)))),
        pw.SizedBox(width: 10),
        pw.Container(
            margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: pw.Text("Languages",
                style: pw.TextStyle(
                    fontSize: 21,
                    color: PdfColors.red,
                    fontWeight: pw.FontWeight.bold))),
      ]),
    ),
    // content
    // pw.Container(
    //     child:
    pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: additional.listLang
            .map((e) =>
                // pw.Container(
                //         child:
                pw.Wrap(children: [
                  pw.Container(
                      child: pw.Text(e.language.text.trim(),
                          style: pw.TextStyle(
                              fontSize: 13,
                              color: PdfColors.white,
                              fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      height: 15,
                      width: 1,
                      color: PdfColors.white,
                      margin: pw.EdgeInsets.fromLTRB(7, 0, 7, 0)),
                  pw.Container(
                      child: pw.Text(e.level.text.trim(),
                          style: pw.TextStyle(
                            fontSize: 13,
                            color: PdfColors.white,
                          ))),
                ]))
            // )
            .toList())
    // )
  ]);
}

pw.Widget buildCetificate1(
    AdditionalModel additional, double width) {
  // final certiKey = GlobalKey();
  return
      //  pw.Container(
      // margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 20),
      // child:
      pw.Column(children: [
    pw.Row(children: [
      pw.Container(
        // key:certiKey,
          height: 20,
          width: 20,
          decoration: pw.BoxDecoration(
              color: PdfColors.black,
              border: pw.Border.all(color: PdfColors.blue, width: 5),
              borderRadius: pw.BorderRadius.all(pw.Radius.circular(10)))),
      pw.SizedBox(width: 10),
      pw.Container(
          margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: pw.Text("Certificates",
              style: pw.TextStyle(
                  fontSize: 21,
                  color: PdfColors.red,
                  fontWeight: pw.FontWeight.bold))),
    ]),
    pw.Column(
        children: additional.listCerti.map((e) {
      return
          // pw.Container(
          //     margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 10),
          //     child:
          pw.Column(children: [
        pw.Container(
            margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: pw.Wrap(children: [
              pw.Row(children: [
                pw.Text("${e.nameCertiController.text.trim()}",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                        // fontSize: 17,
                        color: PdfColors.white,
                        fontWeight: pw.FontWeight.bold)),
              ])
            ], direction: pw.Axis.horizontal)),
        pw.Container(
            margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: pw.Wrap(children: [
              pw.Row(children: [
                pw.Text("${e.dateCertiController.text.trim()}",
                    textAlign: pw.TextAlign.left,
                    style: const pw.TextStyle(
                      // fontSize: 17,
                      color: PdfColors.white,
                      // fontWeight: pw.FontWeight.bold
                    )),
              ])
            ], direction: pw.Axis.horizontal)),
      ]);
      // );
    }).toList())
  ]);
  // );
}

pw.Widget buildAchivement1(
    AdditionalModel additional, double width) {
  return pw.Container(
      // margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 20),
      color: PdfColors.black,
      child: pw.Column(children: [
    pw.Row(children: [
      //icon,
      pw.Container(
          margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: pw.Text("Achivements",
              style: pw.TextStyle(
                  fontSize: 25,
                  color: PdfColors.red,
                  fontWeight: pw.FontWeight.bold))),
    ]),
    pw.Column(
        children: additional.listAchie.map((e) {
      return pw.Container(
          margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: pw.Column(children: [
            pw.Container(
                margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: pw.Wrap(children: [
                  pw.Text("${e.nameAchieController.text.trim()}",
                      textAlign: pw.TextAlign.left,
                      style: pw.TextStyle(
                          fontSize: 17,
                          color: PdfColors.white,
                          fontWeight: pw.FontWeight.bold))
                ], direction: pw.Axis.horizontal)),
            pw.Container(
                margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: pw.Wrap(children: [
                  pw.Text("${e.dateAchieController.text.trim()}",
                      textAlign: pw.TextAlign.left,
                      style: const pw.TextStyle(
                        // fontSize: 17,
                        color: PdfColors.white,
                        // fontWeight: pw.FontWeight.bold
                      )),
                ], direction: pw.Axis.horizontal)),
          ]));
    }).toList())
  ]));
}

//
