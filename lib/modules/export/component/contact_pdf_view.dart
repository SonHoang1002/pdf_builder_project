import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:math';

class ContactPDFView1 extends pw.StatelessWidget {
  final double height;
  final double width;
  ContactPDFView1({required this.height, required this.width});
  @override
  pw.Widget build(pw.Context context) {
    final ContactModel contact = ContactRepo().getContactRepo;
    return pw.Container(
        height: 50 + addExtendedHeight(contact),
        child:
            pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
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
                child: pw.Text("Contact",
                    style: pw.TextStyle(
                        fontSize: 21,
                        color: PdfColors.red,
                        fontWeight: pw.FontWeight.bold))),
          ]),
          pw.Row(children: [
            pw.Text(contact.email.text.trim(),
                style: pw.TextStyle(
                    fontSize: 17,
                    color: PdfColors.red,
                    fontWeight: pw.FontWeight.bold))
          ]),
          pw.Row(children: [
            pw.Text(contact.phone.text.trim(),
                style: pw.TextStyle(
                    fontSize: 17,
                    color: PdfColors.red,
                    fontWeight: pw.FontWeight.bold))
          ]),
          // pw.Container(
          //   child: pw.Row(children: [
              // pw.Flexible(flex: 1, child: pw.Container(height: 1, width: 1)),
              pw.Expanded(
                  child: pw.Text(contact.address.text.trim(),
                      style: pw.TextStyle(
                          fontSize: 17,
                          color: PdfColors.red,
                          fontWeight: pw.FontWeight.bold)))
          //   ]),
          // )

          // pw.Wrap(children: [
          //   pw.Text(contact.address.text.trim(),
          //       style: pw.TextStyle(
          //          fontSize: 21,
          //         color: PdfColors.red,
          //         fontWeight: pw.FontWeight.bold
          //       ))
          // ], direction: pw.Axis.horizontal)
        ]));
  }
}

double addExtendedHeight(ContactModel contact) {
  double extendedAddress = contact.address.text.trim()==""? 0: ((contact.address.text.trim().length /13)).floor() *20 ;
  double extendedPhone = contact.phone.text.trim() == "" ? 0 : 20;
  double extendedEmail = contact.email.text.trim() == "" ? 0 : 20;
  return extendedEmail + extendedPhone + extendedAddress;
}
//