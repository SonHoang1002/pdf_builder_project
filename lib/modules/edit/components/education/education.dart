import 'dart:math';

import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/education_model.dart';
import 'package:cv_1/modules/edit/components/education/blocs/education_bloc.dart';
import 'package:cv_1/modules/edit/components/education/blocs/education_event.dart';
import 'package:cv_1/modules/edit/components/education/blocs/education_state.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

late List<String> fullEducationTitles = [
  "Education",
  "University/School",
  "Degree",
  "Graduation Year",
  "Achievement(Optional)"
];
late List<String> shortEducationTitles = [
  "Education",
  "School",
  "Degree",
  "Graduation",
  "Achievement"
];

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);


  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  bool isBeginPeriod = true;
  late bool isPresent = false;
  late bool isFixing = false;

  late double width = 100;
  late List<EducationModel> listEdu;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return BlocBuilder<EducationBloc, EducationState>(
        builder: ((context, state) {
      listEdu = BlocProvider.of<EducationBloc>(context).state.model;

      final listSchool =
          BlocProvider.of<EducationSchoolTitleCubit>(context).state;
      final listGraduation =
          BlocProvider.of<EducationGraduationTitleCubit>(context).state;
      final listAchiv =
          BlocProvider.of<EducationAchivementTitleCubit>(context).state;

      for (int i = 0; i < listEdu.length; i++) {
        if (listEdu[i].university.text.trim().length > 0) {
          listSchool[i] = shortEducationTitles[1];
          context
              .read<EducationSchoolTitleCubit>()
              .updateEducationSchoolEvent(listSchool);
        }
        if (listEdu[i].grad.text.trim().length > 0) {
          listGraduation[i] = shortEducationTitles[3];
          context
              .read<EducationGraduationTitleCubit>()
              .updateEducationGraduationEvent(listGraduation);
        }
        if (listEdu[i].achie.text.trim().length > 0) {
          listAchiv[i] = shortEducationTitles[4];
          context
              .read<EducationAchivementTitleCubit>()
              .updateEducationAchivementEvent(listAchiv);
        }
      }
      EducationRepo().setEducationRepo(listEdu);
      return Container(
        height: 515,
        margin: const EdgeInsets.only(top: 5),
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
              height: 400,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: isFixing
                  ? ReorderableListView(
                      onReorder: ((oldIndex, newIndex) {
                        if (oldIndex < newIndex) {
                          int end = newIndex - 1;
                          EducationModel startItem = listEdu[oldIndex];
                          int i = 0;
                          int local = oldIndex;
                          do {
                            listEdu[local] = listEdu[++local];
                            i++;
                          } while (i < end - oldIndex);
                          listEdu[end] = startItem;
                        }
                        // dragging from bottom to top
                        else if (oldIndex > newIndex) {
                          EducationModel startItem = listEdu[oldIndex];
                          for (int i = oldIndex; i > newIndex; i--) {
                            listEdu[i] = listEdu[i - 1];
                          }
                          listEdu[newIndex] = startItem;
                        }
                        setState(() {});
                        context
                            .read<EducationBloc>()
                            .add(UpdateEducationEvent(listEdu));
                        EducationRepo().setEducationRepo(listEdu);
                      }),
                      children: listEdu
                          .map((e) => Container(
                                key: Key(Random().nextInt(1000).toString()),
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
                                              removeEduItem(e);
                                              context.read<EducationBloc>().add(
                                                  UpdateEducationEvent(
                                                      listEdu));
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
                                            e.university.text,
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
                              ))
                          .toList(),
                    )
                  : ListView.builder(
                      itemCount: listEdu.length,
                      itemBuilder: (context, index) {
                        return Container(
                            child: listEdu[index].isOpen
                                ? Container(
                                    height: 216,
                                    width: width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    // color: Colors.red,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(children: [
                                      // education title
                                      SizedBox(
                                        width: 0.8 * width,
                                        height: 43,
                                        child: TextFormField(
                                          readOnly: true,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
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
                                                        listEdu[index]
                                                                    .university
                                                                    .text
                                                                    .trim() ==
                                                                ""
                                                            ? fullEducationTitles[
                                                                0]
                                                            : listEdu[index]
                                                                .university
                                                                .text
                                                                .trim(),
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
                                                      listEdu[index].isOpen =
                                                          false;
                                                    });
                                                    context
                                                        .read<EducationBloc>()
                                                        .add(
                                                            UpdateEducationEvent(
                                                                listEdu));
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
                                          child: BlocBuilder<
                                              EducationSchoolTitleCubit,
                                              List<String>>(
                                            builder: ((context, state) {
                                              return TextFormField(
                                                controller:
                                                    listEdu[index].university,
                                                onChanged: (value) {
                                                  context
                                                      .read<EducationBloc>()
                                                      .add(UpdateEducationEvent(
                                                          listEdu));
                                                  EducationRepo()
                                                      .setEducationRepo(
                                                          listEdu);
                                                  final listSchool = context
                                                      .read<
                                                          EducationSchoolTitleCubit>()
                                                      .state;
                                                  if (listEdu[index]
                                                          .university
                                                          .text
                                                          .trim()
                                                          .length >
                                                      0) {
                                                    listSchool[index] =
                                                        shortEducationTitles[1];
                                                  } else {
                                                    listSchool[index] =
                                                        fullEducationTitles[1];
                                                  }
                                                  context
                                                      .read<
                                                          EducationSchoolTitleCubit>()
                                                      .updateEducationSchoolEvent(
                                                          listSchool);
                                                },
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 0, 5, 0),
                                                          child: Text(
                                                            context
                                                                .watch<
                                                                    EducationSchoolTitleCubit>()
                                                                .state[index],
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          )),
                                      // degree
                                      SizedBox(
                                          width: 0.8 * width,
                                          height: 43,
                                          child: TextFormField(
                                            controller: listEdu[index].degree,
                                            onChanged: (value) {
                                              context.read<EducationBloc>().add(
                                                  UpdateEducationEvent(
                                                      listEdu));
                                              EducationRepo()
                                                  .setEducationRepo(listEdu);
                                            },
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 5, 0),
                                                      child: Text(
                                                        fullEducationTitles[2],
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                      //graduation
                                      SizedBox(
                                          width: 0.8 * width,
                                          height: 44,
                                          child: BlocBuilder<
                                              EducationGraduationTitleCubit,
                                              List<String>>(
                                            builder: (context, state) {
                                              return TextFormField(
                                                controller: listEdu[index].grad,
                                                onChanged: (value) {
                                                  context
                                                      .read<EducationBloc>()
                                                      .add(UpdateEducationEvent(
                                                          listEdu));
                                                  EducationRepo()
                                                      .setEducationRepo(
                                                          listEdu);
                                                  final listGraduation = context
                                                      .watch<
                                                          EducationGraduationTitleCubit>()
                                                      .state;
                                                  if (listEdu[index]
                                                      .grad
                                                      .text
                                                      .isEmpty) {
                                                    listGraduation[index] =
                                                        shortEducationTitles[3];
                                                  } else {
                                                    listGraduation[index] =
                                                        fullEducationTitles[3];
                                                  }
                                                  context
                                                      .read<
                                                          EducationGraduationTitleCubit>()
                                                      .updateEducationGraduationEvent(
                                                          listGraduation);
                                                },
                                                readOnly: true,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(
                                                            0, 0, 0, 12),
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    prefixIcon: Container(
                                                      width: 148,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0, 0, 5, 0),
                                                            child: Text(
                                                              context
                                                                  .watch<
                                                                      EducationGraduationTitleCubit>()
                                                                  .state[index],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    suffix: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 26,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _buildTime(index);
                                                          },
                                                          child: SizedBox(
                                                            height: 18,
                                                            width: 18,
                                                            child: Image.asset(
                                                                ConstantVariable
                                                                        .pathImg +
                                                                    "calendar_dark.png"),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              );
                                            },
                                          )),
                                      // achieverment
                                      SizedBox(
                                          width: 0.8 * width,
                                          height: 43,
                                          child: BlocBuilder<
                                              EducationAchivementTitleCubit,
                                              List<String>>(
                                            builder: (context, state) {
                                              return TextFormField(
                                                controller:
                                                    listEdu[index].achie,
                                                onChanged: (value) {
                                                  context
                                                      .read<EducationBloc>()
                                                      .add(UpdateEducationEvent(
                                                          listEdu));
                                                  EducationRepo()
                                                      .setEducationRepo(
                                                          listEdu);
                                                  final listAchiv = context
                                                      .read<
                                                          EducationAchivementTitleCubit>()
                                                      .state;
                                                  if (listEdu[index]
                                                          .achie
                                                          .text
                                                          .trim()
                                                          .length >
                                                      0) {
                                                    listAchiv[index] =
                                                        shortEducationTitles[4];
                                                  } else {
                                                    listAchiv[index] =
                                                        fullEducationTitles[4];
                                                  }
                                                  context
                                                      .read<
                                                          EducationAchivementTitleCubit>()
                                                      .updateEducationAchivementEvent(
                                                          listAchiv);
                                                },
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.normal),
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 0, 5, 0),
                                                          child: Text(
                                                            context
                                                                .watch<
                                                                    EducationAchivementTitleCubit>()
                                                                .state[index],
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          )),
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
                                                        listEdu[index]
                                                                    .university
                                                                    .text
                                                                    .trim() ==
                                                                ''
                                                            ? fullEducationTitles[
                                                                0]
                                                            : listEdu[index]
                                                                .university
                                                                .text
                                                                .trim(),
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
                                                      listEdu[index].isOpen =
                                                          true;
                                                    });
                                                    context
                                                        .read<EducationBloc>()
                                                        .add(
                                                            UpdateEducationEvent(
                                                                listEdu));
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
            // space
            const SizedBox(
              height: 20,
            ),
            //add Education
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
                    context
                        .read<EducationBloc>()
                        .add(UpdateEducationEvent(listEdu));
                    EducationRepo().setEducationRepo(listEdu);
                    final listSchool =
                        BlocProvider.of<EducationSchoolTitleCubit>(context)
                            .state;
                    final listGraduation =
                        BlocProvider.of<EducationGraduationTitleCubit>(context)
                            .state;
                    final listAchiv =
                        BlocProvider.of<EducationAchivementTitleCubit>(context)
                            .state;

                    final List<EducationModel> newListEdu =
                        context.read<EducationBloc>().state.model;
                    print(
                        "------------------${newListEdu.length}---------------");
                    // listSchool.add(newListEdu[newListEdu.length]
                    //             .university
                    //             .text
                    //             .trim()
                    //             .length >
                    //         0
                    //     ? shortEducationTitles[1]
                    //     : fullEducationTitles[1]);
                    // listGraduation.add(
                    //     newListEdu[newListEdu.length].grad.text.trim().length >
                    //             0
                    //         ? shortEducationTitles[3]
                    //         : fullEducationTitles[3]);
                    // listAchiv.add(
                    //     newListEdu[newListEdu.length].achie.text.trim().length >
                    //             0
                    //         ? shortEducationTitles[4]
                    //         : fullEducationTitles[4]);

                    listSchool.add(fullEducationTitles[1]);
                    listGraduation.add(fullEducationTitles[3]);
                    listAchiv.add(fullEducationTitles[4]);
                    // print("listSchool :${listSchool}");
                    // print("listGraduation :${listGraduation}");
                    // print("listAchiv :${listAchiv}");

                    BlocProvider.of<EducationSchoolTitleCubit>(context)
                        .updateEducationSchoolEvent(listSchool);
                    BlocProvider.of<EducationGraduationTitleCubit>(context)
                        .updateEducationGraduationEvent(listGraduation);
                    BlocProvider.of<EducationAchivementTitleCubit>(context)
                        .updateEducationAchivementEvent(listAchiv);
                    // BlocProvider.of<EducationAchivementTitleCubit>(context).updateEducationAchivementEvent()
                  },
                  child: const Text(
                    "Add Education",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }));
  }

  void _buildTime(int index) {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return BottomSheet(
              onClosing: (() {}),
              builder: ((context) {
                return StatefulBuilder(builder: (context, setState) {
                  late String gradValue = "";
                  return Container(
                    height: 600,
                    // width: double.infinity,
                    color: Colors.grey[350],
                    //  color: Colors.red,
                    child: Column(
                      children: [
                        // work period
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  // margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
                                  child: Image.asset(
                                      ConstantVariable.pathImg + "close.png"),
                                ),
                              ),
                              Center(
                                child: Text("Graduation Year"),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() => listEdu[index].grad.text =
                                      DateFormat("MM yyyy")
                                              .format(listEdu[index].startTime)
                                              .toString() +
                                          " - " +
                                          DateFormat("MM yyyy")
                                              .format(listEdu[index].endTime)
                                              .toString());
                                  Navigator.of(context).pop();
                                  context
                                      .read<EducationBloc>()
                                      .add(UpdateEducationEvent(listEdu));
                                  EducationRepo().setEducationRepo(listEdu);
                                },
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),

                        // present working
                        Container(
                          width: width * 0.9,
                          height: 50,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text("Present working here")),
                              CupertinoSwitch(
                                  value: isPresent,
                                  onChanged: ((value) {
                                    setState(() {
                                      isPresent = !isPresent;
                                    });
                                  }))
                            ],
                          )),
                        ),

                        // pick date
                        Container(
                          height: 90,
                          width: 400,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //start date
                              GestureDetector(
                                onTap: () {
                                  setState(() => isBeginPeriod = true);
                                },
                                child: Container(
                                  height: 90,
                                  width: width * 0.44,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      // title start date
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 15, top: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Start Date",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blue),
                                            )
                                          ],
                                        ),
                                      ),
                                      // pick start date
                                      Container(
                                        height: 40,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              // width: 2,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            color: isBeginPeriod
                                                ? Colors.blue
                                                : Colors.white),
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      ///
                                                    },
                                                    child: SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: isBeginPeriod
                                                          ? Image.asset(
                                                              ConstantVariable
                                                                      .pathImg +
                                                                  "calendar_light.png")
                                                          : Image.asset(
                                                              ConstantVariable
                                                                      .pathImg +
                                                                  "calendar_dark.png"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  // endPeriodController.text
                                                  //     .trim(),
                                                  DateFormat("MM yyyy")
                                                      .format(listEdu[index]
                                                          .startTime)
                                                      .toString(),

                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: isBeginPeriod
                                                          ? Colors.white
                                                          : Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              //end date
                              GestureDetector(
                                onTap: () {
                                  setState(() => isBeginPeriod = false);
                                },
                                child: Container(
                                  height: 90,
                                  width: width * 0.44,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // title end date
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 15, top: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "End Date",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blue),
                                            )
                                          ],
                                        ),
                                      ),
                                      // pick end date
                                      Container(
                                        height: 40,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              // width: 2,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            color: !isBeginPeriod
                                                ? Colors.blue
                                                : Colors.white),
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      ///
                                                    },
                                                    child: SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: !isBeginPeriod
                                                          ? Image.asset(
                                                              ConstantVariable
                                                                      .pathImg +
                                                                  "calendar_light.png")
                                                          : Image.asset(
                                                              ConstantVariable
                                                                      .pathImg +
                                                                  "calendar_dark.png"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  DateFormat("MM yyyy")
                                                      .format(listEdu[index]
                                                          .endTime)
                                                      .toString(),
                                                  // "End",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: !isBeginPeriod
                                                          ? Colors.white
                                                          : Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        //choose date from datePicker
                        Container(
                          height: 230,
                          width: width * 0.9,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (value) {
                                print(value);
                                if (isBeginPeriod) {
                                  setState(
                                      () => listEdu[index].startTime = value);
                                } else {
                                  setState(
                                      () => listEdu[index].endTime = value);
                                }
                              },
                              initialDateTime: isBeginPeriod
                                  ? listEdu[index].startTime
                                  : listEdu[index].endTime,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
              }));
        }));
  }

  void removeEduItem(EducationModel model) {
    print(
        "${model.university.text} - ${model.degree.text} - ${model.grad.text} - ${model.achie.text} ");
    setState(() {
      listEdu.remove(model);
    });
  }
}
