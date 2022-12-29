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
    return pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
      pw.SizedBox(height: 20),
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
                    color: PdfColors.white,
                    fontWeight: pw.FontWeight.bold))),
      ]),
      pw.Container(
          // margin: pw.EdgeInsets.only(bottom: 3),
          child: pw.Row(
        children: [
          pw.Flexible(
              child: pw.Text(contact.email.text.trim(),
                  style: pw.TextStyle(
                      fontSize: 13,
                      color: PdfColors.grey,
                      fontWeight: pw.FontWeight.bold)))
        ],
      )),
      pw.SizedBox(height: 5),
      pw.Row(children: [
        pw.Text(contact.phone.text.trim(),
            style: pw.TextStyle(
                fontSize: 13,
                color: PdfColors.grey,
                fontWeight: pw.FontWeight.bold))
      ]),
      pw.SizedBox(height: 5),
      pw.Container(
          child: pw.Row(
        children: [
          pw.Flexible(
              child: pw.Text(contact.address.text.trim(),
              // textAlign: pw.TextAlign.justify,
                  style: pw.TextStyle(
                      fontSize: 13,
                      color: PdfColors.grey,
                      fontWeight: pw.FontWeight.bold)))
        ],
      ))
    ]);
  }
}
