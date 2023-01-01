import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InformationPDFView1 extends pw.StatelessWidget {
  // final double height;
  // final double width;
  // InformationPDFView1({required this.height, required this.width});
  @override
  pw.Widget build(pw.Context context) {
    final InformationModel information = InformationRepo().getInformationRepo;
    final SummaryModel summary = SummaryRepo().getSummaryRepo;
    return pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
      pw.Container(
          // margin: pw.EdgeInsets.fromLTRB(10, 0, 0, 5),
          margin: pw.EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: pw.Row(children: [
            pw.Text(information.fullName.text.trim(),
                style: pw.TextStyle(
                    fontSize: 35,
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold))
          ])),
      pw.Container(
          // margin: const pw.EdgeInsets.fromLTRB(10, 5, 0, 15),
          margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 15),
          child: pw.Row(children: [
            pw.Text(information.jobTitle.text.trim(),
                style: pw.TextStyle(
                    fontSize: 17,
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold))
          ])),
      pw.Container(

          // margin: const pw.EdgeInsets.fromLTRB(10, 0, 0, 0),
          margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 55),
          child: pw.Row(
            children: [
              pw.Flexible(
                  flex: 20,
                  child: pw.Text(summary.summaryController.text.trim(),
                      overflow: pw.TextOverflow.span,
                      textAlign: pw.TextAlign.justify,
                      style: pw.TextStyle(
                        // fontSize: 17,
                        color: PdfColors.grey,
                        // fontWeight: pw.FontWeight.bold
                      )))
            ],
          )),
    ]);
  }
}

class InformationPDFView3 extends pw.StatelessWidget {
  // final double height;
  // final double width;
  // InformationPDFView3({required this.height, required this.width});
  @override
  pw.Widget build(pw.Context context) {
    final InformationModel information = InformationRepo().getInformationRepo;
    final SummaryModel summary = SummaryRepo().getSummaryRepo;
    return pw.Column(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
      pw.Container(
          // margin: pw.EdgeInsets.fromLTRB(10, 0, 0, 5),
          margin: pw.EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: pw.Text(information.fullName.text.trim(),
              style: pw.TextStyle(
                  fontSize: 30,
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold))),
      pw.Container(
          // margin: const pw.EdgeInsets.fromLTRB(10, 5, 0, 15),
          margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 15),
          child: pw.Text(information.jobTitle.text.trim(),
              style: pw.TextStyle(
                  fontSize: 17,
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold))),
      pw.Container(
          // margin: const pw.EdgeInsets.fromLTRB(10, 0, 0, 0),
          margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 55),
          child: pw.Flexible(
              flex: 20,
              child: pw.Text(summary.summaryController.text.trim(),
                  overflow: pw.TextOverflow.span,
                  textAlign: pw.TextAlign.justify,
                  style: pw.TextStyle(
                    // fontSize: 17,
                    color: PdfColors.grey,
                    // fontWeight: pw.FontWeight.bold
                  )))),
    ]);
  }
}
