import 'dart:math';

import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/additional_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cv_1/models/education_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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
  late AdditionalModel additionalModel = AdditionalModel([
    Language(TextEditingController(text: "Englishsdfsdfsd"),
        TextEditingController(text: "Native")),
    // Language(TextEditingController(text: "Viet"),
    //     TextEditingController(text: "Native")),
  ], [
    Certificate(TextEditingController(text: "Certification 1"),
        TextEditingController(text: ""), DateTime.now())
  ], [
    Achivement(TextEditingController(text: "Achievement 1"),
        TextEditingController(text: ""), DateTime.now())
  ], false, true, false);

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
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        height: (515 +
            20 *
                (additionalModel.listAchie.length +
                    additionalModel.listCerti.length +
                    additionalModel.listLang.length -
                    3)),
        // color: Colors.yellow,
        margin: const EdgeInsets.only(top: 45),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //edit button
              Container(
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
                height: (400 +
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                FontWeight
                                                                    .bold),
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
                                              height: (additionalModel
                                                      .listLang.length *
                                                  55),
                                              child: ReorderableListView(
                                                onReorder:
                                                    ((oldIndex, newIndex) {
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
                                                                  .listLang[
                                                              ++local];
                                                      i++;
                                                    } while (
                                                        i < end - oldIndex);
                                                    additionalModel
                                                            .listLang[end] =
                                                        startItem;
                                                  }
                                                  // dragging from bottom to top
                                                  else if (oldIndex >
                                                      newIndex) {
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
                                                    additionalModel.listLang[
                                                        newIndex] = startItem;
                                                  }
                                                  setState(() {});
                                                }),
                                                children:
                                                    additionalModel.listLang
                                                        .map((e) => Container(
                                                              key: Key(
                                                                  "${Random().nextInt(10000)}"),
                                                              margin: EdgeInsets
                                                                  .fromLTRB(10,
                                                                      5, 10, 5),
                                                              // color: Colors.red,
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                              height: 43,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        width *
                                                                            0.7,
                                                                    child: Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            // removeEduItem(e);
                                                                          },
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            child:
                                                                                Image.asset(ConstantVariable.pathImg + "remove.png"),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          e.language
                                                                              .text,
                                                                          style:
                                                                              const TextStyle(fontWeight: FontWeight.bold),
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
                                                                            width:
                                                                                20,
                                                                            child:
                                                                                Image.asset(ConstantVariable.pathImg + "reorder.png"),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              15,
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
                                                          padding: EdgeInsets
                                                              .fromLTRB(
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
                                                                    .fromLTRB(
                                                                        10,
                                                                        0,
                                                                        5,
                                                                        0),
                                                                height: 43,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            10)),
                                                                    color: Colors
                                                                            .grey[
                                                                        300]),
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
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
                                                                          fillColor: Colors.grey[
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
                                                                    .fromLTRB(
                                                                        5,
                                                                        0,
                                                                        10,
                                                                        0),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            10)),
                                                                    color: Colors
                                                                            .grey[
                                                                        300]),
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
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
                                                                          fillColor: Colors.grey[
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
                                                    margin: EdgeInsets.only(
                                                        top: 10),
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 5, 0),
                                                      child: Text(
                                                        "Languages",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                    height: (128 +
                                        additionalModel.listCerti.length * 55),
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
                                      // certification title
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                FontWeight
                                                                    .bold),
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
                                                      additionalModel
                                                          .certiOpen = false;
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
                                              height: (additionalModel
                                                      .listCerti.length *
                                                  55),
                                              child: ReorderableListView(
                                                onReorder:
                                                    ((oldIndex, newIndex) {
                                                  if (oldIndex < newIndex) {
                                                    int end = newIndex - 1;
                                                    Certificate startItem =
                                                        additionalModel
                                                                .listCerti[
                                                            oldIndex];
                                                    int i = 0;
                                                    int local = oldIndex;
                                                    do {
                                                      additionalModel.listCerti[
                                                              local] =
                                                          additionalModel
                                                                  .listCerti[
                                                              ++local];
                                                      i++;
                                                    } while (
                                                        i < end - oldIndex);
                                                    additionalModel
                                                            .listCerti[end] =
                                                        startItem;
                                                  }
                                                  // dragging from bottom to top
                                                  else if (oldIndex >
                                                      newIndex) {
                                                    Certificate startItem =
                                                        additionalModel
                                                                .listCerti[
                                                            oldIndex];
                                                    for (int i = oldIndex;
                                                        i > newIndex;
                                                        i--) {
                                                      additionalModel
                                                              .listCerti[i] =
                                                          additionalModel
                                                              .listCerti[i - 1];
                                                    }
                                                    additionalModel.listCerti[
                                                        newIndex] = startItem;
                                                  }
                                                  setState(() {});
                                                }),
                                                children:
                                                    additionalModel.listCerti
                                                        .map((e) => Container(
                                                              key: Key(
                                                                  "${Random().nextInt(10000)}"),
                                                              margin: EdgeInsets
                                                                  .fromLTRB(10,
                                                                      5, 10, 5),
                                                              // color: Colors.red,
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                              height: 43,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        width *
                                                                            0.7,
                                                                    child: Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            // removeEduItem(e);
                                                                          },
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            child:
                                                                                Image.asset(ConstantVariable.pathImg + "remove.png"),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          e.nameCertiController
                                                                              .text,
                                                                          style:
                                                                              const TextStyle(fontWeight: FontWeight.bold),
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
                                                                            width:
                                                                                20,
                                                                            child:
                                                                                Image.asset(ConstantVariable.pathImg + "reorder.png"),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              15,
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
                                                      additionalModel.listCerti
                                                              .length *
                                                          55),
                                                  // height: additionalModel.listLang.length >2 ? 150 : additionalModel.listLang.length >1 ? 120 : 70,
                                                  margin: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      color: Colors.grey[300]),
                                                  child: ListView.builder(
                                                      itemCount: additionalModel
                                                          .listCerti.length,
                                                      itemBuilder: (context,
                                                          indexCerti) {
                                                        return Container(
                                                          height: 120,
                                                          color: Colors.blue,
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 10, 0, 5),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                height: 96,
                                                                width: double
                                                                    .infinity,
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            15),
                                                                // color: Colors.red,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                child: Column(
                                                                  children: [
                                                                    //phone
                                                                    SizedBox(
                                                                      width: 0.8 *
                                                                          width,
                                                                      // height: 40,
                                                                      child:
                                                                          TextFormField(
                                                                        inputFormatters: [
                                                                          FilteringTextInputFormatter
                                                                              .digitsOnly,
                                                                          CustomInputFormatter()
                                                                        ],
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        controller: additionalModel
                                                                            .listCerti[indexCerti]
                                                                            .nameCertiController,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                        decoration: InputDecoration(
                                                                            fillColor: Colors
                                                                                .white,
                                                                            filled:
                                                                                true,
                                                                            hintText:
                                                                                "Certificate "),
                                                                      ),
                                                                    ),

                                                                    // email
                                                                    SizedBox(
                                                                      width: 0.8 *
                                                                          width,
                                                                      // height: 40,
                                                                      child:
                                                                          TextFormField(
                                                                        controller: additionalModel
                                                                            .listCerti[indexCerti]
                                                                            .dateCertiController,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          fillColor:
                                                                              Colors.white,
                                                                          filled:
                                                                              true,
                                                                          border:
                                                                              InputBorder.none,
                                                                          hintText:
                                                                              "Date",
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                ),
                                                //add certificate
                                                Center(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
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
                                                              // additionalModel
                                                              //     .listCerti
                                                              //     .add(Certificate(
                                                              //         TextEditingController(
                                                              //             text: ""),
                                                              //         TextEditingController(
                                                              //             text:
                                                              //                 "")));
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 5, 0),
                                                      child: Text(
                                                        "Certificates",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                      additionalModel
                                                          .certiOpen = true;
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
      ),
    );
  }
}

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
