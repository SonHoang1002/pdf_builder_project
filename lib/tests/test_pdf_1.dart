import 'dart:math';

import 'package:cv_1/tests/certificate_model.dart';
import 'package:cv_1/tests/contact_model.dart';
import 'package:cv_1/tests/skill_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';

// class TestPdf1 extends StatelessWidget {
//   const TestPdf1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

Future<Uint8List> generateResume1(PdfPageFormat format) async {
  final doc = pw.Document(title: "My test resume 1", author: "abc");
  final imgAvatar = pw.MemoryImage(
      (await rootBundle.load("assets/images/profile.jpg"))
          .buffer
          .asUint8List());

  List<Contact> listContact = [
    Contact(
        img: imgAvatar,
        text: "kdkgjhkgksk ksjjgkskfs sgkskg kgjldfkjgl sdkgskgksg"),
    Contact(
        img: imgAvatar,
        text: "kdkgjhkgksk ksjjgkskfs sgkskg kgjldfkjgl sdkgskgksg"),
    Contact(
        img: imgAvatar,
        text: "kdkgjhkgksk ksjjgkskfs sgkskg kgjldfkjgl sdkgskgksg"),
    Contact(
        img: imgAvatar,
        text: "kdkgjhkgksk ksjjgkskfs sgkskg kgjldfkjgl sdkgskgksg"),
  ];
  List<Skill> listSkill = [
    Skill(content: "Subject ${Random().nextInt(10)}", appreciate: 7),
    Skill(
        content: "Subject ${Random().nextInt(10)}",
        appreciate: Random().nextInt(10)),
    Skill(
        content: "Subject ${Random().nextInt(10)}",
        appreciate: Random().nextInt(10)),
    Skill(
        content: "Subject ${Random().nextInt(10)}",
        appreciate: Random().nextInt(10)),
  ];
  List<Certificate> listCerti = [
    Certificate(
        title: "Certificate 1",
        date: DateTime.now(),
        content: Content(
            mainContent: "doc va thi 2 chung chi trong 1 ngay",
            subContent: [
              "subContent 1 sdfsddddddsdfsdf sdfsdfsdfsfddfs",
              "subContent 2 sdfsdffsdfsewerewvcxvv"
            ])),
    Certificate(
        title: "Certificate 1",
        date: DateTime.now(),
        content: Content(
            mainContent: "doc va thi 2 chung chi trong 1 ngay",
            subContent: ["subContent 1", "subContent 2"])),
  ];
 
  doc.addPage(
    pw.MultiPage(
    build: (context) => [
      pw.Partitions(children: [
        pw.Partition(
            flex: 16,
            child: 
              pw.Container(
                height: double.infinity,
                color: PdfColors.green,
                child: pw.Column(children: [
                  pw.Center(
                      child: pw.Container(
                          height: 100,
                          width: 100,
                          child: pw.ClipOval(
                            child: pw.Image(imgAvatar),
                          ))),
                  _buildContact(listContact: listContact),
                  _buildSkill(listSkill: listSkill),
                  _buildCertificate(listCerti: listCerti)
                ]))
                ),
        pw.Partition(
            flex: 20,
            child: pw.Container(height: double.infinity, color: PdfColors.red)),
      ]),
    ],
  ));

  return doc.save();
}

//build Contact
class _buildContact extends pw.StatelessWidget {
  final List<Contact> listContact;

  _buildContact({required this.listContact});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Container(
          child: pw.Column(children: [
        pw.Container(
            height: 40,
            width: 180,
            child: pw.Center(child: pw.Text("Hello")),
            decoration: pw.BoxDecoration(
                color: PdfColors.red,
                borderRadius: pw.BorderRadius.only(
                    topRight: pw.Radius.circular(20),
                    bottomRight: pw.Radius.circular(20)))),
        pw.SizedBox(height: 20),
        pw.ListView.builder(
            itemCount: listContact.length,
            itemBuilder: ((pw.Context context, index) {
              return _buildContactDetail(
                  imgAvatar: listContact[index].img,
                  text: listContact[index].text);
            }))
      ])),
      pw.SizedBox(height: 20),
    ]);
  }
}

class _buildContactDetail extends pw.StatelessWidget {
  final pw.ImageProvider imgAvatar;
  final String text;
  _buildContactDetail({required this.imgAvatar, required this.text});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        width: 180,
        margin: pw.EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: pw.Row(children: [
          pw.Flexible(
              flex: 2,
              child: pw.Center(
                  child: pw.SizedBox(
                      height: 20, width: 20, child: pw.Image(imgAvatar)))),
          pw.Flexible(flex: 6, child: pw.Text(text))
        ]));
  }
}

// build skill

class _buildSkill extends pw.StatelessWidget {
  final List<Skill> listSkill;

  _buildSkill({required this.listSkill});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Container(
          child: pw.Column(children: [
        pw.Container(
            height: 40,
            width: 180,
            child: pw.Center(child: pw.Text("Skills")),
            decoration: pw.BoxDecoration(
                color: PdfColors.red,
                borderRadius: pw.BorderRadius.only(
                    topRight: pw.Radius.circular(20),
                    bottomRight: pw.Radius.circular(20)))),
        pw.SizedBox(height: 20),
        pw.ListView.builder(
            itemCount: listSkill.length,
            itemBuilder: ((pw.Context context, index) {
              return _buildSkillDetail(
                  content: listSkill[index].content,
                  appriciate: listSkill[index].appreciate,
                  max: _setAppriciate());
            }))
      ])),
      pw.SizedBox(height: 20),
    ]);
  }

  int _setAppriciate() {
    int max = listSkill[0].appreciate;
    for (int i = 0; i < listSkill.length; i++) {
      if (listSkill[i].appreciate > max) {
        max = listSkill[i].appreciate;
      }
    }
    return max;
  }
}

class _buildSkillDetail extends pw.StatelessWidget {
  final String content;
  final int appriciate;
  final int max;
  _buildSkillDetail(
      {required this.content, required this.appriciate, required this.max});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        width: 180,
        margin: pw.EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: pw.Row(children: [
          pw.Flexible(flex: 5, child: pw.Center(child: pw.Text(content))),
          pw.Flexible(
              flex: 5,
              child: pw.ListView.builder(
                  itemBuilder: ((context, index) {
                    if (index < appriciate) {
                      return pw.Container(
                          height: 7,
                          decoration: pw.BoxDecoration(
                              borderRadius:
                                  pw.BorderRadius.all(pw.Radius.circular(7)),
                              color: PdfColors.blue),
                          width: 7);
                    } else {
                      return pw.Container(
                          height: 7,
                          decoration: pw.BoxDecoration(
                              borderRadius:
                                  pw.BorderRadius.all(pw.Radius.circular(7)),
                              color: PdfColors.grey),
                          width: 7);
                    }
                  }),
                  itemCount: max,
                  direction: pw.Axis.horizontal))
        ]));
  }
}

// certificate

class _buildCertificate extends pw.StatelessWidget {
  final List<Certificate> listCerti;

  _buildCertificate({required this.listCerti});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Container(
          child: pw.Column(children: [
        pw.Container(
            height: 40,
            width: 180,
            child: pw.Center(child: pw.Text("Certificates")),
            decoration: pw.BoxDecoration(
                color: PdfColors.red,
                borderRadius: pw.BorderRadius.only(
                    topRight: pw.Radius.circular(20),
                    bottomRight: pw.Radius.circular(20)))),
        pw.SizedBox(height: 20),
        pw.ListView.builder(
            itemCount: listCerti.length,
            itemBuilder: ((pw.Context context, index) {
              // final dateAfterFormat =
              //     DateFormat("MM/yyyy").format(listCerti[index].date);
                  return
              //  pw.Container(
              //     color: PdfColors.black,
              //     height: 200,
              //     child: pw.Column(children: [
              //       pw.Row(children: [
              //         pw.Text(listCerti[index].title,
              //             style: pw.TextStyle(
              //                 color: PdfColors.white,
              //                 fontSize: 20,
              //                 fontWeight: pw.FontWeight.bold)),
              //         pw.Container(
              //             height: 30,
              //             width: 2,
              //             color: PdfColors.white,
              //             margin: pw.EdgeInsets.symmetric(horizontal: 10)),
              //         pw.Text(dateAfterFormat,
              //             style: pw.TextStyle(
              //                 color: PdfColors.white,
              //                 fontSize: 20,
              //                 fontWeight: pw.FontWeight.bold)),
              //       ]),
                    _buildCertificateDetail(
                        subContent: listCerti[index].content.subContent);
                  // ]));
            }))
      ])),
      pw.SizedBox(height: 20),
    ]);
  }
}

class _buildCertificateDetail extends pw.StatelessWidget {
  final List<String> subContent;

  _buildCertificateDetail({required this.subContent});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        child: pw.ListView.builder(
            itemBuilder: ((context, index) {
              return pw.Container(
                  width: 180,
                  margin: pw.EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: pw.Row(children: [
                    pw.Flexible(
                        flex: 1,
                        child: pw.Container(
                            height: 7,
                            decoration: pw.BoxDecoration(
                                borderRadius:
                                    pw.BorderRadius.all(pw.Radius.circular(3)),
                                color: PdfColors.black),
                            width: 7)),
                    pw.SizedBox(width: 5),
                    pw.Flexible(flex: 6, child: pw.Text(subContent[index]))
                  ]));
            }),
            itemCount: subContent.length));
  }
}
