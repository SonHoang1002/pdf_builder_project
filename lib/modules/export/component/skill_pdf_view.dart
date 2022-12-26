import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SkillPDFView1 extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        child: pw.Column(children: [
      pw.Container(
          margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: pw.Text("Skill",
              style: pw.TextStyle(
                  fontSize: 25,
                  color: PdfColors.red,
                  fontWeight: pw.FontWeight.bold))),
      pw.Container(
          child: pw.Column(
              children: SkillRepo().getSkillRepo.map((element) {
        return pw.Wrap(
            children: [pw.Text(element.skill.text.trim())],
            direction: pw.Axis.horizontal);
      }).toList())),
    ]));
  }
}
