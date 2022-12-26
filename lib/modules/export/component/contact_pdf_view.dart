import 'package:cv_1/models/export_all_models.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ContactPDFView1 extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    final ContactModel contact = ContactRepo().getContactRepo;
    return pw.Container(
        child: pw.Column(children: [
      pw.Container(
          margin: const pw.EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: pw.Text("Contact",
              style: pw.TextStyle(
                  fontSize: 25,
                  color: PdfColors.red,
                  fontWeight: pw.FontWeight.bold))),
      pw.Container(child: pw.Text(contact.email.text.trim())),
      pw.Container(child: pw.Text(contact.phone.text.trim())),
      pw.Container(
          child: pw.Wrap(
              children: [pw.Text(contact.address.text.trim())],
              direction: pw.Axis.horizontal)),
    ]));
  }
}
