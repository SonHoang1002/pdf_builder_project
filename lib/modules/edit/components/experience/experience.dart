import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/experience_model.dart';
import 'package:cv_1/modules/edit/components/experience/blocs/experience_bloc.dart';
import 'package:cv_1/modules/edit/components/experience/blocs/experience_event.dart';
import 'package:cv_1/modules/edit/components/experience/blocs/experience_state.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  // late TextEditingController eduController = TextEditingController(text: "");
  // late TextEditingController uniController = TextEditingController(text: "");
  // late TextEditingController periodController = TextEditingController(text: "");
  // late TextEditingController graController = TextEditingController(text: "");
  // late TextEditingController achieController = TextEditingController(text: "");

  // late List<ExperienceModel> listExp = [
  //   ExperienceModel(
  //       work: TextEditingController(text: ""),
  //       job: TextEditingController(text: ""),
  //       period: TextEditingController(text: ""),
  //       desc: TextEditingController(text: ""),
  //       isOpen: true,
  //       startTime: DateTime.now(),
  //       endTime: DateTime.now())
  // ];
  late List<ExperienceModel> listExp;
  // late List<ExperienceModel> list = ExperienceBloc().state.list;

  late List<String> titles = [
    "Work Experience",
    "Job Title",
    "Work Period",
    "Description",
  ];
  bool isBeginPeriod = true;
  late bool isPresent = false;
  late bool isFixing = false;
  late double width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    //  late List<ExperienceModel> list = BlocProvider.of<ExperienceBloc>(context).state.list;
    // //  late List<ExperienceModel> list = context.watch<ExperienceBloc>().state.list;
    // print("${list[0].job.text} - ${list[0].desc.text}- ${list.length}");
    return BlocBuilder<ExperienceBloc, ExperienceState>(
        bloc: ExperienceBloc(),
        builder: ((context, state) {
          // late List<ExperienceModel> list =
          //     BlocProvider.of<ExperienceBloc>(context).state.list;
          // context.read<ExperienceBloc>().state.list;
          //  late List<ExperienceModel> list = context.watch<ExperienceBloc>().state.list;
          // print("${list[0].job.text} - ${list[0].desc.text}- ${list.length}");
          listExp = BlocProvider.of<ExperienceBloc>(context).state.list;
          ExperienceRepo().setExperienceRepo(listExp);
          
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
                              ExperienceModel startItem = listExp[oldIndex];
                              int i = 0;
                              int local = oldIndex;
                              do {
                                listExp[local] = listExp[++local];
                                i++;
                              } while (i < end - oldIndex);
                              listExp[end] = startItem;
                            }
                            // dragging from bottom to top
                            else if (oldIndex > newIndex) {
                              ExperienceModel startItem = listExp[oldIndex];
                              for (int i = oldIndex; i > newIndex; i--) {
                                listExp[i] = listExp[i - 1];
                              }
                              listExp[newIndex] = startItem;
                            }
                            setState(() {});
                            context
                                .read<ExperienceBloc>()
                                .add(UpdateExperienceEvent(listExp));
                                ExperienceRepo().setExperienceRepo(listExp);
                          }),
                          children: listExp
                              .map((e) => Container(
                                    key: Key(e.job.text),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    // color: Colors.red,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
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
                                                  removeEpxItem(e);
                                                  context
                                                      .read<ExperienceBloc>()
                                                      .add(
                                                          UpdateExperienceEvent(
                                                              listExp));
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
                                                e.job.text,
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
                          itemCount: listExp.length,
                          itemBuilder: (context, index) {
                            return Container(
                                // color: Colors.grey.shade500,
                                // margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: listExp[index].isOpen
                                    ? Container(
                                        height:
                                            listExp[index].desc.text.length <=
                                                    20
                                                ? 174
                                                : 340,
                                        width: width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        // color: Colors.red,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(children: [
                                          // experience
                                          SizedBox(
                                            width: 0.8 * width,
                                            height: 43,
                                            child: TextFormField(
                                              // controller: listExp[index].job,
                                              readOnly: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  prefixIcon: Container(
                                                    width: 111,
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
                                                            listExp[index]
                                                                        .job
                                                                        .text
                                                                        .trim() ==
                                                                    ""
                                                                ? titles[0]
                                                                : listExp[index]
                                                                    .job
                                                                    .text
                                                                    .trim(),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
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
                                                        // ExperienceModel a = listExp[index];
                                                        // print(a.toString);
                                                        // listExp.remove(a);
                                                        // a.isOpen = false;
                                                        setState(() {
                                                          // listExp.add(a);
                                                          listExp[index]
                                                              .isOpen = false;
                                                        });
                                                        context
                                                            .read<
                                                                ExperienceBloc>()
                                                            .add(
                                                                UpdateExperienceEvent(
                                                                    listExp));
                                                      },
                                                      child: Image.asset(
                                                        ConstantVariable
                                                                .pathImg +
                                                            "hide.png",
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          // job title
                                          SizedBox(
                                            width: 0.8 * width,
                                            height: 43,
                                            child: TextFormField(
                                              controller: listExp[index].job,
                                              onChanged: ((value) {
                                                context
                                                    .read<ExperienceBloc>()
                                                    .add(UpdateExperienceEvent(
                                                        listExp));
                                              }),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 9, 0, 0),
                                                fillColor: Colors.white,
                                                filled: true,
                                                prefixIcon: Container(
                                                  width: 111,
                                                  child: Row(
                                                    // mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 5, 0),
                                                        child: Text(
                                                          titles[1],
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
                                            ),
                                          ),
                                          // work period
                                          SizedBox(
                                            width: 0.8 * width,
                                            height: 43,
                                            child: TextFormField(
                                              controller: listExp[index].period,
                                              onChanged: ((value) {
                                                context
                                                    .read<ExperienceBloc>()
                                                    .add(UpdateExperienceEvent(
                                                        listExp));
                                              }),
                                              readOnly: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  prefixIcon: Container(
                                                    width: 111,
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
                                                            titles[2],
                                                            style:
                                                                const TextStyle(
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
                                                        height: 25,
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
                                            ),
                                          ),
                                          //Description
                                          SizedBox(
                                            width: 0.8 * width,
                                            height: listExp[index]
                                                        .desc
                                                        .text
                                                        .length <=
                                                    20
                                                ? 43
                                                : 200,
                                            child: TextFormField(
                                              controller: listExp[index].desc,
                                              // maxLines: null,
                                              onChanged: ((value) {
                                                context
                                                    .read<ExperienceBloc>()
                                                    .add(UpdateExperienceEvent(
                                                        listExp));
                                              }),
                                              maxLines: 10,
                                              // minLines: 0,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 8, 0, 0),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  prefixIcon:
                                                      listExp[index]
                                                                  .desc
                                                                  .text
                                                                  .length <=
                                                              20
                                                          ? Container(
                                                              width: 111,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      titles[3],
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          : null),
                                            ),
                                          ),
                                        ]))
                                    : Container(
                                        width: width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
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
                                              controller: listExp[index].work,
                                              readOnly: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  prefixIcon: Container(
                                                    width: 111,
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
                                                            listExp[index]
                                                                        .job
                                                                        .text
                                                                        .trim() ==
                                                                    ''
                                                                ? titles[0]
                                                                : listExp[index]
                                                                    .job
                                                                    .text
                                                                    .trim(),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
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
                                                          listExp[index]
                                                              .isOpen = true;
                                                        });
                                                        context
                                                            .read<
                                                                ExperienceBloc>()
                                                            .add(
                                                                UpdateExperienceEvent(
                                                                    listExp));
                                                      },
                                                      child: Image.asset(
                                                        ConstantVariable
                                                                .pathImg +
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
                //add Experience
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                          ConstantVariable.pathImg + "icon_add.png"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          listExp.add(ExperienceModel(
                              work: TextEditingController(text: ""),
                              job: TextEditingController(text: "jobjh"),
                              desc: TextEditingController(text: "desc jhjh"),
                              isOpen: true,
                              period: TextEditingController(text: ""),
                              startTime: DateTime.now(),
                              endTime: DateTime.now()));
                        });
                        context
                            .read<ExperienceBloc>()
                            .add(UpdateExperienceEvent(listExp));
                            ExperienceRepo().setExperienceRepo(listExp);
                      },
                      child: const Text(
                        "Add Experience",
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
                  late String periodValue = "";
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
                                child: Text("Work Period"),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() => listExp[index].period.text =
                                      DateFormat("MM yyyy")
                                              .format(listExp[index].startTime)
                                              .toString() +
                                          " - " +
                                          DateFormat("MM yyyy")
                                              .format(listExp[index].endTime)
                                              .toString());
                                  Navigator.of(context).pop();
                                  context
                                      .read<ExperienceBloc>()
                                      .add(UpdateExperienceEvent(listExp));
                                      ExperienceRepo().setExperienceRepo(listExp);
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
                                                      .format(listExp[index]
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
                                                      .format(listExp[index]
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
                                      () => listExp[index].startTime = value);
                                } else {
                                  setState(
                                      () => listExp[index].endTime = value);
                                }
                              },
                              initialDateTime: isBeginPeriod
                                  ? listExp[index].startTime
                                  : listExp[index].endTime,
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

  void removeEpxItem(ExperienceModel model) {
    listExp.remove(model);
  }
}
