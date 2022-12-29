import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SkillPDFView1 extends pw.StatelessWidget {
  final double height;
  final double width;
  SkillPDFView1({required this.height, required this.width});
  final List<SkillModel> listSkill = SkillRepo().getSkillRepo;

  @override
  pw.Widget build(pw.Context context) {
    // testSkill(listSkill);
    return pw.Container(
        // color: PdfColors.yellow,
        child: pw.Column(children: [
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
            child: pw.Text("Skills",
                style: pw.TextStyle(
                    fontSize: 21,
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold))),
      ]),
      // pw.Container(
      //     child:
      pw.Column(
          children: listSkill.map((element) {
        return pw.Container(
          margin: pw.EdgeInsets.only(bottom: 5),
          child: pw.Row(
        children: [
          // pw.SizedBox(height: 5),
          pw.Flexible(
              child: pw.Text(element.skill.text.trim(),
                  style: pw.TextStyle(
                      fontSize: 13,
                      color: PdfColors.grey,
                      fontWeight: pw.FontWeight.bold)))
        ],
      ));
      }).toList())
      // ),
    ]));
  }

  // List<pw.Widget> _buildContent() {
  //   List<pw.Widget> listWidget = [];
  //   for (int i = 0; i < listSkill.length; i++) {
  //     listWidget.add(pw.Wrap(
  //         children: [pw.Text(listSkill[i].skill.text.trim())],
  //         direction: pw.Axis.horizontal));
  //   }
  //   return listWidget;
  // }
}

//
void testSkill(List<SkillModel> list) {
  list.forEach((element) {
    print(element.skill.text.trim());
  });
}
