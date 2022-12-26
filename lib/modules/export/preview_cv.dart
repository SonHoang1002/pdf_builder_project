import 'package:cv_1/tests/test_dropdownlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PriviewCV extends StatefulWidget {
  const PriviewCV({super.key});

  @override
  State<PriviewCV> createState() => _PriviewCVState();
}

class _PriviewCVState extends State<PriviewCV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview")),
      body: PdfPreview(
        build: (format) {
          return generateResume(PdfPageFormat(400, 500));
        },
      ),
    );
  }
}
