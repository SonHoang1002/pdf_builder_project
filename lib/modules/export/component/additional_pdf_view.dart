import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget buildLanguage1(AdditionalModel additional) {
  return pw.Column(children: [
    pw.Row(children: [
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
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold))),
    ]),
    pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: additional.listLang
            .map((e) => pw.Row(children: [
                  pw.Container(
                      child: pw.Text(e.language.text.trim(),
                          style: pw.TextStyle(
                              fontSize: 14,
                              color: PdfColors.grey,
                              fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      height: 15,
                      width: 1,
                      color: PdfColors.grey,
                      margin: pw.EdgeInsets.fromLTRB(7, 0, 7, 0)),
                  pw.Container(
                      child: pw.Text(e.level.text.trim(),
                          style: pw.TextStyle(
                            fontSize: 13,
                            color: PdfColors.white,
                          ))),
                ]))
            .toList())
  ]);
}

pw.Widget buildCetificate1(AdditionalModel additional) {
  return pw.Column(children: [
    pw.Row(children: [
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
          child: pw.Text("Certificates",
              style: pw.TextStyle(
                  fontSize: 21,
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold))),
    ]),
    pw.Column(
        children: additional.listCerti.map((e) {
      return pw.Column(children: [
        pw.Container(
            child: pw.Row(
          children: [
            pw.Flexible(
                flex: 20,
                child: pw.Text(e.nameCertiController.text.trim(),
                    // textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(
                        fontSize: 13,
                        color: PdfColors.grey,
                        fontWeight: pw.FontWeight.bold)))
          ],
        )),
        pw.Container(
            child: pw.Row(
          children: [
            pw.Flexible(
                flex: 20,
                child: pw.Text(e.dateCertiController.text.trim(),
                    // textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(
                        fontSize: 14,
                        color: PdfColors.grey,
                        // fontWeight: pw.FontWeight.bold
                        )))
          ],
        )),
      ]);
    }).toList())
  ]);
}

pw.Widget buildAchivement1(AdditionalModel additional) {
  print(additional.listAchie[0].nameAchieController.text);
  return pw.Column(children: [
    pw.Row(children: [
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
          child: pw.Text("Achivements",
              style: pw.TextStyle(
                  fontSize: 21,
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold))),
    ]),
    pw.Column(
        children: additional.listAchie.map((e) {
      return pw.Container(
          margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: pw.Column(children: [
            pw.Container(
                child: pw.Row(
              children: [
                pw.Flexible(
                    flex: 20,
                    child: pw.Text(e.nameAchieController.text.trim(),
                        // textAlign: pw.TextAlign.justify,
                        style: pw.TextStyle(
                            fontSize: 14,
                            color: PdfColors.grey,
                            fontWeight: pw.FontWeight.bold
                            )))
              ],
            )),
            pw.Container(
                child: pw.Row(
              children: [
                pw.Flexible(
                    flex: 20,
                    child: pw.Text(e.dateAchieController.text.trim(),
                        // textAlign: pw.TextAlign.justify,
                        style: pw.TextStyle(
                            fontSize: 13,
                            color: PdfColors.grey,
                            // fontWeight: pw.FontWeight.bold
                            )))
              ],
            )),
          ]));
    }).toList())
  ]);
}

pw.Widget buildLanguage3(AdditionalModel additional) {
  return pw.Column(children: [
    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
      pw.Row(children: [
        pw.Container(
            margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: pw.Text("Language",
                style: pw.TextStyle(
                    fontSize: 21,
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold))),
      ]),
      pw.Row(children: [
        pw.Container(
            height: 20,
            width: 20,
            decoration: pw.BoxDecoration(
                color: PdfColors.black,
                border: pw.Border.all(color: PdfColors.blue, width: 5))),
        pw.SizedBox(width: 40)
      ]),
    ]),
    pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: additional.listLang
            .map((e) => pw.Row(children: [
                  pw.Container(
                      child: pw.Text(e.language.text.trim(),
                          style: pw.TextStyle(
                              fontSize: 14,
                              color: PdfColors.grey,
                              fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      height: 15,
                      width: 1,
                      color: PdfColors.grey,
                      margin: pw.EdgeInsets.fromLTRB(7, 0, 7, 0)),
                  pw.Container(
                      child: pw.Text(e.level.text.trim(),
                          style: pw.TextStyle(
                            fontSize: 13,
                            color: PdfColors.white,
                          ))),
                ]))
            .toList())
  ]);
}

pw.Widget buildCetificate3(AdditionalModel additional) {
  return pw.Column(children: [
    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
      pw.Row(children: [
        pw.Container(
            margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: pw.Text("Certificates",
                style: pw.TextStyle(
                    fontSize: 21,
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold))),
      ]),
      pw.Row(children: [
        pw.Container(
            height: 20,
            width: 20,
            decoration: pw.BoxDecoration(
                color: PdfColors.black,
                border: pw.Border.all(color: PdfColors.blue, width: 5))),
        pw.SizedBox(width: 40)
      ]),
    ]),
    pw.Column(
        children: additional.listCerti.map((e) {
      return pw.Column(children: [
        pw.Container(
            child: pw.Row(
          children: [
            pw.Flexible(
                flex: 20,
                child: pw.Text(e.nameCertiController.text.trim(),
                    // textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(
                        fontSize: 13,
                        color: PdfColors.grey,
                        fontWeight: pw.FontWeight.bold)))
          ],
        )),
        pw.Container(
            child: pw.Row(
          children: [
            pw.Flexible(
                flex: 20,
                child: pw.Text(e.dateCertiController.text.trim(),
                    // textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(
                        fontSize: 13,
                        color: PdfColors.grey,
                        fontWeight: pw.FontWeight.bold)))
          ],
        )),
      ]);
    }).toList())
  ]);
}

pw.Widget buildAchivement3(AdditionalModel additional) {
  print(additional.listAchie[0].nameAchieController.text);
  return pw.Column(children: [
    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
      pw.Row(children: [
        pw.Container(
            margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: pw.Text("Achivement",
                style: pw.TextStyle(
                    fontSize: 21,
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold))),
      ]),
      pw.Row(children: [
        pw.Container(
            height: 20,
            width: 20,
            decoration: pw.BoxDecoration(
                color: PdfColors.black,
                border: pw.Border.all(color: PdfColors.blue, width: 5))),
        pw.SizedBox(width: 40)
      ]),
    ]),
    pw.Column(
        children: additional.listAchie.map((e) {
      return pw.Container(
          margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: pw.Column(children: [
            pw.Container(
                child: pw.Row(
              children: [
                pw.Flexible(
                    flex: 20,
                    child: pw.Text(e.nameAchieController.text.trim(),
                        // textAlign: pw.TextAlign.justify,
                        style: pw.TextStyle(
                            fontSize: 13,
                            color: PdfColors.grey,
                            fontWeight: pw.FontWeight.bold)))
              ],
            )),
            pw.Container(
                child: pw.Row(
              children: [
                pw.Flexible(
                    flex: 20,
                    child: pw.Text(e.dateAchieController.text.trim(),
                        // textAlign: pw.TextAlign.justify,
                        style: pw.TextStyle(
                            fontSize: 13,
                            color: PdfColors.grey,
                            fontWeight: pw.FontWeight.bold)))
              ],
            )),
          ]));
    }).toList())
  ]);
}
