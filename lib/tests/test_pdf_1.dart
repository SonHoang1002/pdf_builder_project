import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class TestPdf1 extends StatelessWidget {
  const TestPdf1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<Uint8List> generateResume1(PdfPageFormat format) {
  final doc = pw.Document(title: "My test resume 1", author: "abc");

  doc.addPage(
    pw.MultiPage(build: (context) => [
      pw.Partitions(children: [
        pw.Partition(child: pw.Row(children: [
          // avatar, lien he, ky nang, chung chi, 
          pw.Column(children: [
            pw.Container(height: 200,width: 200,)
          ]),
          //gioi thieu, kinh nghiem lam viec, hoc van
          pw.Column(children: [

          ])
        ]))
      ]),
    ],)
  );

  return doc.save();
}
