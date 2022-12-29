import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class EducationPDFView1 extends pw.StatelessWidget {
  final double height;
  final double width;
  EducationPDFView1({required this.height, required this.width});
  @override
  pw.Widget build(pw.Context context) {
    final List<EducationModel> listEdu = EducationRepo().getEducationRepo;

    return pw.Column(children: [
      pw.Row(children: [
        pw.Container(
            height: 20,
            width: 20,
            decoration: pw.BoxDecoration(
                color: PdfColors.black,
                border: pw.Border.all(color: PdfColors.blue, width: 5))),
        pw.SizedBox(width: 10),
        pw.Container(
            margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: pw.Text("Educations",
                style: pw.TextStyle(
                    fontSize: 21,
                    color: PdfColors.red,
                    fontWeight: pw.FontWeight.bold))),
      ]),
      pw.Column(
          children: listEdu.map((e) {
        return pw.Container(
            margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: pw.Column(children: [
              pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: pw.Row(children: [
                    pw.Flexible(
                        flex: 20,
                        child: pw.Text(
                            "${e.university.text} - ${e.degree.text}",
                            style: pw.TextStyle(
                                color: PdfColors.grey,
                                fontSize: 13,
                                fontWeight: pw.FontWeight.bold)))
                  ])),
              pw.Container(
                  margin: const pw.EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: pw.Row(children: [
                    pw.Flexible(
                        flex: 20,
                        child: pw.Text(
                            "${e.startTime.month}/${e.startTime.year} -${e.endTime.month}/${e.endTime.year}",
                            style: pw.TextStyle(
                              color: PdfColors.grey,
                              // fontSize: 13,
                              // fontWeight: pw.FontWeight.bold
                            )))
                  ])),
            ]));
      }).toList())
    ]);
  }
}
//

