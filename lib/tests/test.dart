import 'dart:math';

import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/additional_model.dart';
import 'package:cv_1/tests/test_dropdownlist.dart';
import 'package:cv_1/tests/test_pdf_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cv_1/models/education_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class TestModel {
  TextEditingController name;
  TextEditingController job;
  TextEditingController date;
  TestModel({required this.name, required this.job, required this.date});
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PdfPreview(
        build: (context)=> 
            generateResume1(PdfPageFormat(width,height)))
    );
  }
}

// Container(
//         child: Center(
//             child: ElevatedButton(
//           onPressed: () {
//             generateResume(PdfPageFormat(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height));
//           },
//           child: Text("Test gen pdf"),
//         )),
//       ),
class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  // late TextEditingController startPeriodController =
  //     TextEditingController(text: "March 2019");
  // late TextEditingController endPeriodController =
  //     TextEditingController(text: "March 2019");

  late List<EducationModel> listEdu = [
    EducationModel(
        university: TextEditingController(text: ""),
        degree: TextEditingController(text: ""),
        grad: TextEditingController(text: ""),
        achie: TextEditingController(text: ""),
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        isOpen: true)
  ];

  late List<String> titles = [
    "Education",
    "University/School",
    "Degree",
    "Graduation Year",
    "Achievement(Optional)"
  ];
  late bool isFixing = false;

  late double width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: 515,
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 25),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isFixing
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isFixing = false;
                            });
                          },
                          child: Text(
                            "Done",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              isFixing = true;
                            });
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                  SizedBox(
                    width: 25,
                  )
                ],
              ),
            ),
            //input tags
            Container(
              height: 400,
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: ListView.builder(
                itemCount: listEdu.length,
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.grey.shade500,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: isFixing
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              // color: Colors.red,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            removeEduItem(index);
                                          },
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                                ConstantVariable.pathImg +
                                                    "remove.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          listEdu[index].university.text.trim(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // width: width * 0.1,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                                ConstantVariable.pathImg +
                                                    "reorder.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : listEdu[index].isOpen
                              ? Container(
                                  height: 220,
                                  width: width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  // color: Colors.red,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    // education
                                    SizedBox(
                                      width: 0.8 * width,
                                      height: 43,
                                      child: TextFormField(
                                        // controller: listEdu[index].university,
                                        readOnly: true,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            prefixIcon: Container(
                                              width: 148,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 5, 0),
                                                    child: Text(
                                                      listEdu[index]
                                                                  .university
                                                                  .text
                                                                  .trim() ==
                                                              ""
                                                          ? titles[0]
                                                          : listEdu[index]
                                                              .university
                                                              .text
                                                              .trim(),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            suffixIcon: SizedBox(
                                              height: 5,
                                              width: 5,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    listEdu[index].isOpen =
                                                        false;
                                                  });
                                                },
                                                child: Image.asset(
                                                  ConstantVariable.pathImg +
                                                      "hide.png",
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                    // university
                                    SizedBox(
                                      width: 0.8 * width,
                                      height: 43,
                                      child: TextFormField(
                                        controller: listEdu[index].university,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  0, 9, 0, 0),
                                          fillColor: Colors.white,
                                          filled: true,
                                          prefixIcon: Container(
                                            width: 148,
                                            child: Row(
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 5, 0),
                                                  child: Text(
                                                    titles[1],
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // degree
                                    SizedBox(
                                      width: 0.8 * width,
                                      height: 43,
                                      child: TextFormField(
                                        controller: listEdu[index].degree,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  0, 8, 0, 0),
                                          fillColor: Colors.white,
                                          filled: true,
                                          prefixIcon: Container(
                                            width: 148,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 5, 0),
                                                  child: Text(
                                                    titles[2],
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //graduation
                                    SizedBox(
                                      width: 0.8 * width,
                                      height: 48,
                                      child: TextFormField(
                                        controller: listEdu[index].grad,
                                        readOnly: true,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    0, 8, 0, 0),
                                            fillColor: Colors.white,
                                            filled: true,
                                            prefixIcon: Container(
                                              width: 148,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 5, 0),
                                                    child: Text(
                                                      titles[3],
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            suffix: Column(
                                              children: [
                                                // const SizedBox(
                                                //   height: 19,
                                                // ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                  ),
                                                  onPressed: () {
                                                    // _buildTime();
                                                  },
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    // achieverment
                                    SizedBox(
                                      width: 0.8 * width,
                                      height: 43,
                                      child: TextFormField(
                                        controller: listEdu[index].achie,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  0, 8, 0, 0),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: InputBorder.none,
                                          prefixIcon: Container(
                                            width: 148,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 5, 0),
                                                  child: Text(
                                                    titles[4],
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]))
                              : Container(
                                  width: width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  // color: Colors.red,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    SizedBox(
                                      width: 0.8 * width,
                                      height: 43,
                                      child: TextFormField(
                                        readOnly: true,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Colors.white,
                                            filled: true,
                                            prefixIcon: Container(
                                              width: 148,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 5, 0),
                                                    child: Text(
                                                      listEdu[index]
                                                                  .university
                                                                  .text
                                                                  .trim() ==
                                                              ''
                                                          ? titles[0]
                                                          : listEdu[index]
                                                              .university
                                                              .text
                                                              .trim(),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            suffixIcon: SizedBox(
                                              height: 5,
                                              width: 5,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    listEdu[index].isOpen =
                                                        true;
                                                  });
                                                },
                                                child: Image.asset(
                                                  ConstantVariable.pathImg +
                                                      "show.png",
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ])));
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  child: Image.asset(ConstantVariable.pathImg + "icon_add.png"),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      listEdu.add(EducationModel(
                          university: TextEditingController(text: "new uni"),
                          degree: TextEditingController(text: "new de"),
                          grad: TextEditingController(text: "new grad"),
                          achie: TextEditingController(text: "new achie"),
                          startTime: DateTime.now(),
                          endTime: DateTime.now(),
                          isOpen: true));
                    });
                  },
                  child: const Text(
                    "Add Test1",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void removeEduItem(int index) {
    print(
        "${listEdu[index].university.text} - ${listEdu[index].degree.text} - ${listEdu[index].grad.text} - ${listEdu[index].achie.text} ");
  }
}
