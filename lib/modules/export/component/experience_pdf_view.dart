import 'package:cv_1/models/experience_model.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ExperiencePDFView1 extends pw.StatelessWidget {
  // final double height;
  // final double width;
  // ExperiencePDFView1({required this.height, required this.width});
  final List<ExperienceModel> listExp = ExperienceRepo().getExperienceRepo;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Container(
        child: pw.Row(children: [
          pw.Container(
              height: 20,
              width: 20,
              decoration: pw.BoxDecoration(
                  color: PdfColors.black,
                  border: pw.Border.all(color: PdfColors.blue, width: 5))),
          pw.SizedBox(width: 10),
          pw.Container(
              margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: pw.Text("Experience",
                  style: pw.TextStyle(
                      fontSize: 21,
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold))),
        ]),
      ),
      pw.Container(
          child: pw.Column(
              children: listExp.map((e) {
        return pw.Container(
            child: pw.Column(children: [
          //title
          pw.Container(
              margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: pw.Row(children: [
                pw.Flexible(
                    flex: 20,
                    child: pw.Text(e.period.text.trim(),
                        style: pw.TextStyle(
                            color: PdfColors.grey,
                            fontSize: 20,
                            fontWeight: pw.FontWeight.bold)))
              ])),
          //date
          pw.Container(
              margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: pw.Row(children: [
                pw.Flexible(
                    flex: 20,
                    child: pw.Text(e.period.text.trim(),
                        style: pw.TextStyle(
                            color: PdfColors.grey,
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold)))
              ])),
          // content
          pw.Container(
              child: pw.Column(
                  children:
                      e.desc.text.trim().split("\n").map((subDescription) {
            return pw.Container(
                child: pw.Row(children: [
              pw.Flexible(
                  flex: 1,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                            // color: PdfColors.white,
                            margin: const pw.EdgeInsets.fromLTRB(0, 0, 5, 0),
                            height: 4,
                            width: 4,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.red,
                                borderRadius:
                                    pw.BorderRadius.all(pw.Radius.circular(2))))
                      ])),
              pw.Flexible(
                  flex: 20,
                  child: pw.Container(
                      child: pw.Wrap(direction: pw.Axis.horizontal, children: [
                    pw.Text(subDescription,
                        style: pw.TextStyle(
                          color: PdfColors.grey,
                        ))
                  ]))),
            ]));
          }).toList())),
        ]));
      }).toList()))
    ]);
  }
}



class ExperiencePDFView3 extends pw.StatelessWidget {
  // final double height;
  // final double width;
  // ExperiencePDFView3({required this.height, required this.width});
  final List<ExperienceModel> listExp = ExperienceRepo().getExperienceRepo;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.SizedBox(height: 5),
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
        pw.Row(children: [
          // pw.SizedBox(width: 10),
          pw.Container(
              margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: pw.Text("Experience",
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
      //
      pw.Container(
          child: pw.Column(
              children: listExp.map((e) {
        return pw.Container(
            child: pw.Column(children: [
          //title
          pw.Container(
              margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: pw.Row(children: [
                pw.Flexible(
                    flex: 20,
                    child: pw.Text(e.period.text.trim(),
                        style: pw.TextStyle(
                            color: PdfColors.grey,
                            fontSize: 20,
                            fontWeight: pw.FontWeight.bold)))
              ])),
          //date
          pw.Container(
              margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: pw.Row(children: [
                pw.Flexible(
                    flex: 20,
                    child: pw.Text(e.period.text.trim(),
                        style: pw.TextStyle(
                            color: PdfColors.grey,
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold)))
              ])),
          // content
          pw.Container(
              child: pw.Column(
                  children:
                      e.desc.text.trim().split("\n").map((subDescription) {
            return pw.Container(
                child: pw.Row(children: [
              pw.Flexible(
                  flex: 1,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                            // color: PdfColors.white,
                            margin: const pw.EdgeInsets.fromLTRB(0, 0, 5, 0),
                            height: 4,
                            width: 4,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.red,
                                borderRadius:
                                    pw.BorderRadius.all(pw.Radius.circular(2))))
                      ])),
              pw.Flexible(
                  flex: 20,
                  child: pw.Container(
                      child: pw.Wrap(direction: pw.Axis.horizontal, children: [
                    pw.Text(subDescription,
                        style: pw.TextStyle(
                          color: PdfColors.grey,
                        ))
                  ]))),
            ]));
          }).toList())),
        ]));
      }).toList()))
    ]);
  }
}