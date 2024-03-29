import 'dart:math';

import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/additional_model.dart';
import 'package:cv_1/modules/edit/components/additional/blocs/additional_bloc.dart';
import 'package:cv_1/modules/edit/components/additional/blocs/additional_event.dart';
import 'package:cv_1/modules/edit/components/additional/blocs/additional_state.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Additional extends StatefulWidget {
  
  @override
  State<Additional> createState() => _AdditionalState();
}

class _AdditionalState extends State<Additional> {
  // late AdditionalModel additionalModel = AdditionalModel([
  //   Language(TextEditingController(text: "English"),
  //       TextEditingController(text: "Native")),
  //   // Language(TextEditingController(text: "Viet"),
  //   //     TextEditingController(text: "Native")),
  // ], [
  //   Certificate(TextEditingController(text: "Certification 1"),
  //       TextEditingController(text: ""), DateTime.now())
  // ], [
  //   Achivement(TextEditingController(text: "Achievement 1"),
  //       TextEditingController(text: ""), DateTime.now())
  // ], false, false, false);

  bool isBeginPeriod = true;
  late bool isPresent = false;
  late bool isFixing = false;

  late double width = 100;
  // bool isBeginPeriod = true;
  // late bool isPresent = false;
  // late String listEdu[index].startTime =
  //     DateFormat("MM yyyy").format(DateTime.now()).toString();
  // late String listEdu[index].endTime = DateFormat("MM yyyy").format(DateTime.now()).toString();
  late AdditionalModel additionalModel;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return BlocBuilder<AdditionalBloc, AdditionalState>(
        builder: ((context, state) {
      additionalModel =
          BlocProvider.of<AdditionalBloc>(context).state.additionalModel;
      AdditionalRepo().setAdditionalRepo(additionalModel);
      return Container(
        height: (660),
        // color: Colors.yellow,
        margin: const EdgeInsets.only(top: 5, bottom: 10),
        padding: const EdgeInsets.only(top: 5, bottom: 10),
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
                          child: const Text(
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
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                  const SizedBox(
                    width: 25,
                  )
                ],
              ),
              //input tags
              Container(
                height: (600
                    ),
                // color: Colors.green,
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
                                    height: isFixing
                                        ? (100 +
                                            additionalModel.listLang.length *
                                                70)
                                        : (100 +
                                            additionalModel.listLang.length *
                                                53),
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
                                                          "${ConstantVariable.pathImg}languages.png"),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 5, 0),
                                                      child: Text(
                                                        "Languages",
                                                        style: TextStyle(
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
                                                    context
                                                        .read<AdditionalBloc>()
                                                        .add(UpdateAdditionalEvent(
                                                            additionalModel));
                                                    AdditionalRepo()
                                                        .setAdditionalRepo(
                                                            additionalModel);
                                                  },
                                                  child: Image.asset(
                                                    "${ConstantVariable.pathImg}hide.png",
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                      // language inputs
                                      isFixing
                                          ? Container(
                                              color: Colors.red,
                                              height: (10 +
                                                  additionalModel
                                                          .listLang.length *
                                                      70),
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

                                                  context
                                                      .read<AdditionalBloc>()
                                                      .add(
                                                          UpdateAdditionalEvent(
                                                              additionalModel));
                                                  AdditionalRepo()
                                                      .setAdditionalRepo(
                                                          additionalModel);
                                                }),
                                                children:
                                                    additionalModel.listLang
                                                        .map((e) => Container(
                                                              key: Key(
                                                                  "${Random().nextInt(1000)}"),
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                              // color: Colors.red,
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                              height: 50,
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
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            removeLanguageItem(e);
                                                                            context.read<AdditionalBloc>().add(UpdateAdditionalEvent(additionalModel));
                                                                            AdditionalRepo().setAdditionalRepo(additionalModel);
                                                                          },
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            child:
                                                                                Image.asset("${ConstantVariable.pathImg}remove.png"),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
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
                                                                                Image.asset("${ConstantVariable.pathImg}reorder.png"),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
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
                                                  height: (13 +
                                                      additionalModel
                                                              .listLang.length *
                                                          53),
                                                  padding: EdgeInsets.only(
                                                      bottom: 5),
                                                  // color: Colors.red,
                                                  child: ListView.builder(
                                                      itemCount: additionalModel
                                                          .listLang.length,
                                                      itemBuilder:
                                                          (context, indexLang) {
                                                        return Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 1, 0, 5),
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
                                                                        indexLang ==
                                                                                0
                                                                            ? 10
                                                                            : 5,
                                                                        0,
                                                                        0),
                                                                height: 43,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    color: Colors
                                                                            .grey[
                                                                        100]),
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
                                                                      onChanged:
                                                                          (value) {
                                                                        context
                                                                            .read<AdditionalBloc>()
                                                                            .add(UpdateAdditionalEvent(additionalModel));
                                                                      },
                                                                      style: const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      decoration: InputDecoration(
                                                                          hintText:
                                                                              "Language",
                                                                          contentPadding: const EdgeInsets.fromLTRB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              3),
                                                                          fillColor: Colors.grey[
                                                                              100],
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
                                                                        indexLang ==
                                                                                0
                                                                            ? 10
                                                                            : 5,
                                                                        10,
                                                                        0),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    color: Colors
                                                                            .grey[
                                                                        100]),
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
                                                                      onChanged:
                                                                          ((value) {
                                                                        context
                                                                            .read<AdditionalBloc>()
                                                                            .add(UpdateAdditionalEvent(additionalModel));
                                                                        AdditionalRepo()
                                                                            .setAdditionalRepo(additionalModel);
                                                                      }),
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
                                                                              100],
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
                                                        const EdgeInsets.only(
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
                                                              "${ConstantVariable.pathImg}icon_add.png"),
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
                                                            context
                                                                .read<
                                                                    AdditionalBloc>()
                                                                .add(UpdateAdditionalEvent(
                                                                    additionalModel));
                                                            AdditionalRepo()
                                                                .setAdditionalRepo(
                                                                    additionalModel);
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
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 5, 0),
                                                      child: Text(
                                                        "Languages",
                                                        style: TextStyle(
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
                                                    context
                                                        .read<AdditionalBloc>()
                                                        .add(UpdateAdditionalEvent(
                                                            additionalModel));
                                                    AdditionalRepo()
                                                        .setAdditionalRepo(
                                                            additionalModel);
                                                  },
                                                  child: Image.asset(
                                                    "${ConstantVariable.pathImg}show.png",
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ]))),

                        // certificates
                        Container(
                            child: additionalModel.certiOpen
                                ? Container(
                                    height: isFixing
                                        ? (23 +
                                            additionalModel.listCerti.length *
                                                100 -
                                            (additionalModel.listCerti.length -
                                                    1) *
                                                20)
                                        : (85 +
                                            additionalModel.listCerti.length *
                                                106),
                                    width: width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      height: 35,
                                                      width: 35,
                                                      child: Image.asset(
                                                          "${ConstantVariable.pathImg}certificates.png"),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 5, 0),
                                                      child: Text(
                                                        "Certificates",
                                                        style: TextStyle(
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
                                                    context
                                                        .read<AdditionalBloc>()
                                                        .add(UpdateAdditionalEvent(
                                                            additionalModel));
                                                    AdditionalRepo()
                                                        .setAdditionalRepo(
                                                            additionalModel);
                                                  },
                                                  child: Image.asset(
                                                    "${ConstantVariable.pathImg}hide.png",
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
                                                      80 -
                                                  (additionalModel.listCerti
                                                              .length -
                                                          1) *
                                                      10),
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
                                                  context
                                                      .read<AdditionalBloc>()
                                                      .add(
                                                          UpdateAdditionalEvent(
                                                              additionalModel));
                                                  AdditionalRepo()
                                                      .setAdditionalRepo(
                                                          additionalModel);
                                                }),
                                                children:
                                                    additionalModel.listCerti
                                                        .map((e) => Container(
                                                              key: Key(
                                                                  "${Random().nextInt(10000)}"),
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                              // color: Colors.red,
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                              height: 50,
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
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            removeCertificateItem(e);
                                                                            context.read<AdditionalBloc>().add(UpdateAdditionalEvent(additionalModel));
                                                                            AdditionalRepo().setAdditionalRepo(additionalModel);
                                                                          },
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            child:
                                                                                Image.asset("${ConstantVariable.pathImg}remove.png"),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
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
                                                                                Image.asset("${ConstantVariable.pathImg}reorder.png"),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
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
                                                  height: (additionalModel
                                                          .listCerti.length *
                                                      106),
                                                  //  color: Colors.red,
                                                  child: ListView.builder(
                                                      itemCount: additionalModel
                                                          .listCerti.length,
                                                      itemBuilder: (context,
                                                          indexCerti) {
                                                        return Container(
                                                          height: 96,
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  5,
                                                                  indexCerti ==
                                                                          0
                                                                      ? 10
                                                                      : 5,
                                                                  5,
                                                                  5),
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 5, 0, 5),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          20)),
                                                              color: Colors
                                                                  .grey[100]),
                                                          child: Column(
                                                            children: [
                                                              // certificate input
                                                              Container(
                                                                height: 43,
                                                                width: 320,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    color: Colors
                                                                            .grey[
                                                                        100]),
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    child:
                                                                        TextFormField(
                                                                      controller: additionalModel
                                                                          .listCerti[
                                                                              indexCerti]
                                                                          .nameCertiController,
                                                                      onChanged:
                                                                          (value) {
                                                                        context
                                                                            .read<AdditionalBloc>()
                                                                            .add(UpdateAdditionalEvent(additionalModel));
                                                                        AdditionalRepo()
                                                                            .setAdditionalRepo(additionalModel);
                                                                      },
                                                                      style: const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Certificates",
                                                                        fillColor:
                                                                            Colors.grey[100],
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
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    color: Colors
                                                                            .grey[
                                                                        100]),
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    child:
                                                                        TextFormField(
                                                                      readOnly:
                                                                          true,
                                                                      controller: additionalModel
                                                                          .listCerti[
                                                                              indexCerti]
                                                                          .dateCertiController,
                                                                      onChanged:
                                                                          (value) {
                                                                        context
                                                                            .read<AdditionalBloc>()
                                                                            .add(UpdateAdditionalEvent(additionalModel));
                                                                        AdditionalRepo()
                                                                            .setAdditionalRepo(additionalModel);
                                                                      },
                                                                      style: const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      decoration: InputDecoration(
                                                                          // suffix: Column(mainAxisAlignment:MainAxisAlignment.center,children: [SizedBox(height: 20,width: 20,child: Image.asset(ConstantVariable.pathImg+"calendar_light.png"),)],),
                                                                          suffixIcon: GestureDetector(
                                                                            child:
                                                                                const Icon(Icons.calendar_month),
                                                                            onTap:
                                                                                (() {
                                                                              showModalBottomSheet(
                                                                                  context: context,
                                                                                  builder: ((context) {
                                                                                    return CupertinoDatePicker(
                                                                                      mode: CupertinoDatePickerMode.date,
                                                                                      onDateTimeChanged: (value) {
                                                                                        // if (value != null && value != additionalModel.listCerti[index].dateCertiController.text.trim())
                                                                                        setState(() {
                                                                                          additionalModel.listCerti[indexCerti].dateCertiController.text = DateFormat("dd-MM-yyyy").format(value);
                                                                                        });
                                                                                      },
                                                                                      initialDateTime: DateTime.now(),
                                                                                    );
                                                                                  }));
                                                                            }),
                                                                          ),
                                                                          hintText: "Date",
                                                                          fillColor: Colors.grey[100],
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
                                                        const EdgeInsets.only(
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
                                                              "${ConstantVariable.pathImg}icon_add.png"),
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
                                                            context
                                                                .read<
                                                                    AdditionalBloc>()
                                                                .add(UpdateAdditionalEvent(
                                                                    additionalModel));
                                                            AdditionalRepo()
                                                                .setAdditionalRepo(
                                                                    additionalModel);
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
                                                  children: const [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 5, 0),
                                                      child: Text(
                                                        "Certificate",
                                                        style: TextStyle(
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
                                                    context
                                                        .read<AdditionalBloc>()
                                                        .add(UpdateAdditionalEvent(
                                                            additionalModel));
                                                    AdditionalRepo()
                                                        .setAdditionalRepo(
                                                            additionalModel);
                                                  },
                                                  child: Image.asset(
                                                    "${ConstantVariable.pathImg}show.png",
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ]))),

                        // achievement
                        Container(
                            child: additionalModel.achieOpen
                                ? Container(
                                    height: isFixing
                                        ? (23 +
                                            additionalModel.listAchie.length *
                                                100 -
                                            (additionalModel.listAchie.length -
                                                    1) *
                                                20)
                                        : (85 +
                                            additionalModel.listAchie.length *
                                                106),
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      height: 35,
                                                      width: 35,
                                                      child: Image.asset(
                                                          "${ConstantVariable.pathImg}achivements.png"),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 5, 0),
                                                      child: Text(
                                                        "Achievements",
                                                        style: TextStyle(
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
                                                          .achieOpen = false;
                                                    });
                                                    context
                                                        .read<AdditionalBloc>()
                                                        .add(UpdateAdditionalEvent(
                                                            additionalModel));
                                                    AdditionalRepo()
                                                        .setAdditionalRepo(
                                                            additionalModel);
                                                  },
                                                  child: Image.asset(
                                                    "${ConstantVariable.pathImg}hide.png",
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                      // Achievement inputs
                                      isFixing
                                          ? Container(
                                              color: Colors.red,
                                              height: (additionalModel
                                                          .listAchie.length *
                                                      80 -
                                                  (additionalModel.listAchie
                                                              .length -
                                                          1) *
                                                      10),
                                              child: ReorderableListView(
                                                onReorder:
                                                    ((oldIndex, newIndex) {
                                                  if (oldIndex < newIndex) {
                                                    int end = newIndex - 1;
                                                    Achivement startItem =
                                                        additionalModel
                                                                .listAchie[
                                                            oldIndex];
                                                    int i = 0;
                                                    int local = oldIndex;
                                                    do {
                                                      additionalModel.listAchie[
                                                              local] =
                                                          additionalModel
                                                                  .listAchie[
                                                              ++local];
                                                      i++;
                                                    } while (
                                                        i < end - oldIndex);
                                                    additionalModel
                                                            .listAchie[end] =
                                                        startItem;
                                                  }
                                                  // dragging from bottom to top
                                                  else if (oldIndex >
                                                      newIndex) {
                                                    Achivement startItem =
                                                        additionalModel
                                                                .listAchie[
                                                            oldIndex];
                                                    for (int i = oldIndex;
                                                        i > newIndex;
                                                        i--) {
                                                      additionalModel
                                                              .listAchie[i] =
                                                          additionalModel
                                                              .listAchie[i - 1];
                                                    }
                                                    additionalModel.listAchie[
                                                        newIndex] = startItem;
                                                  }
                                                  setState(() {});
                                                  context
                                                      .read<AdditionalBloc>()
                                                      .add(
                                                          UpdateAdditionalEvent(
                                                              additionalModel));
                                                  AdditionalRepo()
                                                      .setAdditionalRepo(
                                                          additionalModel);
                                                }),
                                                children:
                                                    additionalModel.listAchie
                                                        .map((e) => Container(
                                                              key: Key(
                                                                  "${Random().nextInt(1000)}"),
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                              // color: Colors.red,
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                              height: 50,
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
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            removeAchivementItem(e);
                                                                            context.read<AdditionalBloc>().add(UpdateAdditionalEvent(additionalModel));
                                                                            AdditionalRepo().setAdditionalRepo(additionalModel);
                                                                          },
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                20,
                                                                            width:
                                                                                20,
                                                                            child:
                                                                                Image.asset("${ConstantVariable.pathImg}remove.png"),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          e.nameAchieController
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
                                                                                Image.asset("${ConstantVariable.pathImg}reorder.png"),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
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
                                                  height: (additionalModel
                                                          .listAchie.length *
                                                      106),
                                                  // color: Colors.red,
                                                  child: ListView.builder(
                                                      itemCount: additionalModel
                                                          .listAchie.length,
                                                      itemBuilder: (context,
                                                          indexAchie) {
                                                        return Container(
                                                          height: 96,
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  5,
                                                                  indexAchie ==
                                                                          0
                                                                      ? 10
                                                                      : 5,
                                                                  5,
                                                                  5),
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 5, 0, 5),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          20)),
                                                              color: Colors
                                                                  .grey[100]),
                                                          child: Column(
                                                            children: [
                                                              // certificate input
                                                              Container(
                                                                height: 43,
                                                                width: 320,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    color: Colors
                                                                            .grey[
                                                                        100]),
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    child:
                                                                        TextFormField(
                                                                      controller: additionalModel
                                                                          .listAchie[
                                                                              indexAchie]
                                                                          .nameAchieController,
                                                                      onChanged:
                                                                          (value) {
                                                                        context
                                                                            .read<AdditionalBloc>()
                                                                            .add(UpdateAdditionalEvent(additionalModel));
                                                                        AdditionalRepo()
                                                                            .setAdditionalRepo(additionalModel);
                                                                      },
                                                                      style: const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Achievement",
                                                                        fillColor:
                                                                            Colors.grey[100],
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
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    color: Colors
                                                                            .grey[
                                                                        100]),
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    child:
                                                                        TextFormField(
                                                                      readOnly:
                                                                          true,
                                                                      controller: additionalModel
                                                                          .listAchie[
                                                                              indexAchie]
                                                                          .dateAchieController,
                                                                      onChanged:
                                                                          (value) {
                                                                        context
                                                                            .read<AdditionalBloc>()
                                                                            .add(UpdateAdditionalEvent(additionalModel));
                                                                        AdditionalRepo()
                                                                            .setAdditionalRepo(additionalModel);
                                                                      },
                                                                      style: const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      decoration: InputDecoration(
                                                                          // suffix: Column(mainAxisAlignment:MainAxisAlignment.center,children: [SizedBox(height: 20,width: 20,child: Image.asset(ConstantVariable.pathImg+"calendar_light.png"),)],),
                                                                          suffixIcon: GestureDetector(
                                                                            child:
                                                                                const Icon(Icons.calendar_month),
                                                                            onTap:
                                                                                (() {
                                                                              showModalBottomSheet(
                                                                                  context: context,
                                                                                  builder: ((context) {
                                                                                    return CupertinoDatePicker(
                                                                                      mode: CupertinoDatePickerMode.date,
                                                                                      onDateTimeChanged: (value) {
                                                                                        // if (value != null && value != additionalModel.listAchie[index].dateAchieController.text.trim())
                                                                                        setState(() {
                                                                                          additionalModel.listAchie[indexAchie].dateAchieController.text = DateFormat("dd-MM-yyyy").format(value);
                                                                                        });
                                                                                      },
                                                                                      initialDateTime: DateTime.now(),
                                                                                    );
                                                                                  }));
                                                                            }),
                                                                          ),
                                                                          hintText: "Date",
                                                                          fillColor: Colors.grey[100],
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
                                                        const EdgeInsets.only(
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
                                                              "${ConstantVariable.pathImg}icon_add.png"),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              additionalModel
                                                                  .listAchie
                                                                  .add(Achivement(
                                                                      TextEditingController(
                                                                          text:
                                                                              "Achivement ${Random().nextInt(10000)}"),
                                                                      TextEditingController(
                                                                          text:
                                                                              "${DateTime.now()}"),
                                                                      DateTime
                                                                          .now()));
                                                            });
                                                            context
                                                                .read<
                                                                    AdditionalBloc>()
                                                                .add(UpdateAdditionalEvent(
                                                                    additionalModel));
                                                            AdditionalRepo()
                                                                .setAdditionalRepo(
                                                                    additionalModel);
                                                          },
                                                          child: const Text(
                                                            "Add Achievement",
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
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 5, 0),
                                                      child: Text(
                                                        "Certificate",
                                                        style: TextStyle(
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
                                                          .achieOpen = true;
                                                    });
                                                    context
                                                        .read<AdditionalBloc>()
                                                        .add(UpdateAdditionalEvent(
                                                            additionalModel));
                                                    AdditionalRepo()
                                                        .setAdditionalRepo(
                                                            additionalModel);
                                                  },
                                                  child: Image.asset(
                                                    "${ConstantVariable.pathImg}show.png",
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
    }));
  }

  removeLanguageItem(Language language) {
    additionalModel.listLang.remove(language);
  }

  removeCertificateItem(Certificate certificate) {
    additionalModel.listCerti.remove(certificate);
  }

  removeAchivementItem(Achivement achivement) {
    additionalModel.listAchie.remove(achivement);
  }
}
