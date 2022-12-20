import 'dart:math';

import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/additional_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Additional extends StatefulWidget {
  const Additional({super.key});

  @override
  State<Additional> createState() => _AdditionalState();
}

class _AdditionalState extends State<Additional> {
  late AdditionalModel additionalModel = AdditionalModel([
    Language(TextEditingController(text: "English"),
        TextEditingController(text: "Native")),
    // Language(TextEditingController(text: "Viet"),
    //     TextEditingController(text: "Native")),
  ], [
    Certificate(TextEditingController(text: "Certification 1"),
        TextEditingController(text: ""), DateTime.now())
  ], [
    Achivement(TextEditingController(text: "Achievement 1"),
        TextEditingController(text: ""), DateTime.now())
  ], false, false, false);

  bool isBeginPeriod = true;
  late bool isPresent = false;
  late bool isFixing = false;

  late double width = 100;
  // bool isBeginPeriod = true;
  // late bool isPresent = false;
  // late String listEdu[index].startTime =
  //     DateFormat("MM yyyy").format(DateTime.now()).toString();
  // late String listEdu[index].endTime = DateFormat("MM yyyy").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      height: (515 +
          20 *
              (additionalModel.listAchie.length +
                  additionalModel.listCerti.length +
                  additionalModel.listLang.length -
                  3)),
      // color: Colors.yellow,
      margin: const EdgeInsets.only(top: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //edit button
            Row(
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
            //input tags
            Container(
              height: (500 +
                  20 *
                      (additionalModel.listAchie.length +
                          additionalModel.listCerti.length +
                          additionalModel.listLang.length -
                          3)),
              // color: Colors.red,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      //languages
                      Container(
                          child: additionalModel.langOpen
                              ? Container(
                                  // height: additionalModel.listLang.length >2 ? 230 : additionalModel.listLang.length >1 ? 200 :160,
                                  height: (115 +
                                      additionalModel.listLang.length * 55),
                                  width: width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  // color: Colors.red,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      // color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    // language title
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
                                                  SizedBox(
                                                    height: 35,
                                                    width: 35,
                                                    child: Image.asset(
                                                        ConstantVariable
                                                                .pathImg +
                                                            "languages.png"),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 5, 0),
                                                    child: Text(
                                                      "Languages",
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
                                                    additionalModel.langOpen =
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
                                    // language inputs
                                    isFixing
                                        ? Container(
                                            color: Colors.red,
                                            height: (30 +
                                                additionalModel
                                                        .listLang.length *
                                                    55),
                                            child: ReorderableListView(
                                              onReorder: ((oldIndex, newIndex) {
                                                if (oldIndex < newIndex) {
                                                  int end = newIndex - 1;
                                                  Language startItem =
                                                      additionalModel
                                                          .listLang[oldIndex];
                                                  int i = 0;
                                                  int local = oldIndex;
                                                  do {
                                                    additionalModel
                                                            .listLang[local] =
                                                        additionalModel
                                                            .listLang[++local];
                                                    i++;
                                                  } while (i < end - oldIndex);
                                                  additionalModel
                                                          .listLang[end] =
                                                      startItem;
                                                }
                                                // dragging from bottom to top
                                                else if (oldIndex > newIndex) {
                                                  Language startItem =
                                                      additionalModel
                                                          .listLang[oldIndex];
                                                  for (int i = oldIndex;
                                                      i > newIndex;
                                                      i--) {
                                                    additionalModel
                                                            .listLang[i] =
                                                        additionalModel
                                                            .listLang[i - 1];
                                                  }
                                                  additionalModel
                                                          .listLang[newIndex] =
                                                      startItem;
                                                }
                                                setState(() {});
                                              }),
                                              children: additionalModel.listLang
                                                  .map((e) => Container(
                                                        key: Key(
                                                            "${Random().nextInt(10000)}"),
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                        // color: Colors.red,
                                                        decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                        height: 50,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  width * 0.7,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      // removeEduItem(e);
                                                                    },
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          20,
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
                                                                    e.language
                                                                        .text,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              // width: width * 0.1,
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () {},
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          20,
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
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Container(
                                                height: (25 +
                                                    additionalModel
                                                            .listLang.length *
                                                        55),
                                                // height: additionalModel.listLang.length >2 ? 150 : additionalModel.listLang.length >1 ? 120 : 70,
                                                color: Colors.red,
                                                child: ListView.builder(
                                                    itemCount: additionalModel
                                                        .listLang.length,
                                                    itemBuilder:
                                                        (context, indexLang) {
                                                      return Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 10, 0, 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            // language input
                                                            Container(
                                                              width:
                                                                  0.5 * width,
                                                              margin: EdgeInsets
                                                                  .fromLTRB(10,
                                                                      0, 5, 0),
                                                              height: 43,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                  color: Colors
                                                                          .grey[
                                                                      300]),
                                                              child: Center(
                                                                child: SizedBox(
                                                                  height: 43,
                                                                  width: width *
                                                                      0.4655,
                                                                  child:
                                                                      TextFormField(
                                                                    controller: additionalModel
                                                                        .listLang[
                                                                            indexLang]
                                                                        .language,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            "Language",
                                                                        contentPadding: EdgeInsets.fromLTRB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            3),
                                                                        fillColor:
                                                                            Colors.grey[
                                                                                300],
                                                                        filled:
                                                                            true,
                                                                        border:
                                                                            InputBorder.none),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            //level input
                                                            Container(
                                                              width:
                                                                  0.3 * width,
                                                              height: 43,
                                                              margin: EdgeInsets
                                                                  .fromLTRB(5,
                                                                      0, 10, 0),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                  color: Colors
                                                                          .grey[
                                                                      300]),
                                                              child: Center(
                                                                child: SizedBox(
                                                                  height: 43,
                                                                  width: width *
                                                                      0.2655,
                                                                  child:
                                                                      TextFormField(
                                                                    controller: additionalModel
                                                                        .listLang[
                                                                            indexLang]
                                                                        .level,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            "Level",
                                                                        contentPadding: const EdgeInsets.fromLTRB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            3),
                                                                        fillColor:
                                                                            Colors.grey[
                                                                                300],
                                                                        filled:
                                                                            true,
                                                                        border:
                                                                            InputBorder.none),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                              //add language
                                              Center(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        child: Image.asset(
                                                            ConstantVariable
                                                                    .pathImg +
                                                                "icon_add.png"),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            additionalModel
                                                                .listLang
                                                                .add(Language(
                                                                    TextEditingController(
                                                                        text:
                                                                            ""),
                                                                    TextEditingController(
                                                                        text:
                                                                            "")));
                                                          });
                                                        },
                                                        child: const Text(
                                                          "Add Language",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 16),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
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
                                                      "Languages",
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
                                                    additionalModel.langOpen =
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
                                  ]))),

                      Container(
                          child: additionalModel.certiOpen
                              ? Container(
                                  // height: additionalModel.listLang.length >2 ? 230 : additionalModel.listLang.length >1 ? 200 :160,
                                  height: (140 +
                                      additionalModel.listCerti.length * 101),
                                  width: width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  // color: Colors.red,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      // color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(children: [
                                    // Certificate title
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
                                                  SizedBox(
                                                    height: 35,
                                                    width: 35,
                                                    child: Image.asset(
                                                        ConstantVariable
                                                                .pathImg +
                                                            "certificates.png"),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 5, 0),
                                                    child: Text(
                                                      "Certificates",
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
                                                    additionalModel.certiOpen =
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
                                    // certificates inputs
                                    isFixing
                                        ? Container(
                                            color: Colors.red,
                                            height: (-145 +
                                                additionalModel
                                                        .listCerti.length *
                                                    101),
                                            child: ReorderableListView(
                                              onReorder: ((oldIndex, newIndex) {
                                                if (oldIndex < newIndex) {
                                                  int end = newIndex - 1;
                                                  Certificate startItem =
                                                      additionalModel
                                                          .listCerti[oldIndex];
                                                  int i = 0;
                                                  int local = oldIndex;
                                                  do {
                                                    additionalModel
                                                            .listCerti[local] =
                                                        additionalModel
                                                            .listCerti[++local];
                                                    i++;
                                                  } while (i < end - oldIndex);
                                                  additionalModel
                                                          .listCerti[end] =
                                                      startItem;
                                                }
                                                // dragging from bottom to top
                                                else if (oldIndex > newIndex) {
                                                  Certificate startItem =
                                                      additionalModel
                                                          .listCerti[oldIndex];
                                                  for (int i = oldIndex;
                                                      i > newIndex;
                                                      i--) {
                                                    additionalModel
                                                            .listCerti[i] =
                                                        additionalModel
                                                            .listCerti[i - 1];
                                                  }
                                                  additionalModel
                                                          .listCerti[newIndex] =
                                                      startItem;
                                                }
                                                setState(() {});
                                              }),
                                              children: additionalModel
                                                  .listCerti
                                                  .map((e) => Container(
                                                        key: Key(
                                                            "${Random().nextInt(10000)}"),
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                        // color: Colors.red,
                                                        decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                        height: 50,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  width * 0.7,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      // removeEduItem(e);
                                                                    },
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          20,
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
                                                                    e.nameCertiController
                                                                        .text,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              // width: width * 0.1,
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () {},
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          20,
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
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Container(
                                                height: (55 +
                                                    additionalModel
                                                            .listCerti.length *
                                                        101),
                                                // height: additionalModel.listLang.length >2 ? 150 : additionalModel.listLang.length >1 ? 120 : 70,
                                                color: Colors.red,
                                                child: ListView.builder(
                                                    itemCount: additionalModel
                                                        .listCerti.length,
                                                    itemBuilder:
                                                        (context, indexLang) {
                                                      return Container(
                                                        height: 96,
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                5, 5, 5, 5),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 5, 0, 5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            color: Colors
                                                                .grey[300]),
                                                        child: Column(
                                                          children: [
                                                            // certificate input
                                                            Container(
                                                              height: 43,
                                                              width: 320,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                  color: Colors
                                                                          .grey[
                                                                      300]),
                                                              child: Center(
                                                                child: SizedBox(
                                                                  child:
                                                                      TextFormField(
                                                                    controller: additionalModel
                                                                        .listCerti[
                                                                            indexLang]
                                                                        .nameCertiController,
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          "Certificate",
                                                                      fillColor:
                                                                          Colors
                                                                              .grey[300],
                                                                      filled:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            // date input
                                                            Container(
                                                              height: 43,
                                                              width: 320,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                  color: Colors
                                                                          .grey[
                                                                      300]),
                                                              child: Center(
                                                                child: SizedBox(
                                                                  child:
                                                                      TextFormField(
                                                                    readOnly:
                                                                        true,
                                                                    controller: additionalModel
                                                                        .listCerti[
                                                                            indexLang]
                                                                        .dateCertiController,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    decoration: InputDecoration(
                                                                        // suffix: Column(mainAxisAlignment:MainAxisAlignment.center,children: [SizedBox(height: 20,width: 20,child: Image.asset(ConstantVariable.pathImg+"calendar_light.png"),)],),
                                                                        suffixIcon: GestureDetector(
                                                                          child:
                                                                              Icon(Icons.calendar_month),
                                                                          onTap:
                                                                              (() {
                                                                            showModalBottomSheet(
                                                                                context: context,
                                                                                builder: ((context) {
                                                                                  return CupertinoDatePicker(
                                                                                    mode: CupertinoDatePickerMode.date,
                                                                                    onDateTimeChanged: (value) {
                                                                                      if (value != null && value != additionalModel.listCerti[index].dateCertiController.text.trim())
                                                                                        setState(() {
                                                                                          additionalModel.listCerti[index].dateCertiController.text = DateFormat("dd-MM-yyyy").format(value);
                                                                                        });
                                                                                    },
                                                                                    initialDateTime: DateTime.now(),
                                                                                  );
                                                                                }));
                                                                          }),
                                                                        ),
                                                                        hintText: "Date",
                                                                        fillColor: Colors.grey[300],
                                                                        filled: true,
                                                                        border: InputBorder.none),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                              //add Certificate
                                              Center(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        child: Image.asset(
                                                            ConstantVariable
                                                                    .pathImg +
                                                                "icon_add.png"),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            additionalModel
                                                                .listCerti
                                                                .add(Certificate(
                                                                    TextEditingController(
                                                                        text:
                                                                            "certi ${Random().nextInt(100)}"),
                                                                    TextEditingController(
                                                                        text:
                                                                            "1212"),
                                                                    DateTime
                                                                        .now()));
                                                          });
                                                        },
                                                        child: const Text(
                                                          "Add Certificate",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 16),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
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
                                                      "Certificate",
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
                                                    additionalModel.certiOpen =
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
                                  ])))
                    ],
                  );
                },
              ),
            ),
            // space
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  double _buildHeightForLanguageElement() {
    double height = 100;
    return height;
  }
}
