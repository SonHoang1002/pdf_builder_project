import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/skill_model.dart';
import 'package:cv_1/modules/edit/components/skill/blocs/skill_bloc.dart';
import 'package:cv_1/modules/edit/components/skill/blocs/skill_event.dart';
import 'package:cv_1/modules/edit/components/skill/blocs/skill_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Skill extends StatefulWidget {
  const Skill({super.key});

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  // late List<SkillModel> listSkill = [
  //   SkillModel(skill: TextEditingController(text: ""))
  // ];
  late List<SkillModel> listSkill;

  late List<String> titles = [
    "Skill",
    "University/School",
    "Degree",
    "Graduation Year",
    "Achievement(Optional)"
  ];

  bool isBeginPeriod = true;
  late bool isPresent = false;
  late bool isFixing = false;

  late double width = 100;
  // bool isBeginPeriod = true;
  // late bool isPresent = false;
  // late String listSkill[index].startTime =
  //     DateFormat("MM yyyy").format(DateTime.now()).toString();
  // late String listSkill[index].endTime = DateFormat("MM yyyy").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    // listSkill.forEach((element) {
    //   print(element.skill.text);
    // });
    return BlocBuilder<SkillBloc, SkillState>(builder: ((context, state) {
      listSkill =
          BlocProvider.of<SkillBloc>(context).state.listSkill;
      // print(list[0].skill.text);
      return Container(
        height: 515,
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
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
                            SkillModel startItem = listSkill[oldIndex];
                            int i = 0;
                            int local = oldIndex;
                            do {
                              listSkill[local] = listSkill[++local];
                              i++;
                            } while (i < end - oldIndex);
                            listSkill[end] = startItem;
                          }
                          // dragging from bottom to top
                          else if (oldIndex > newIndex) {
                            SkillModel startItem = listSkill[oldIndex];
                            for (int i = oldIndex; i > newIndex; i--) {
                              listSkill[i] = listSkill[i - 1];
                            }
                            listSkill[newIndex] = startItem;
                          }
                          setState(() {});
                          context.read<SkillBloc>().add(UpdateSkill(listSkill));
                        }),
                        children: listSkill
                            .map((e) => Container(
                                  key: Key(e.skill.text),
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
                                                // removeSkillItem(index);
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
                                              e.skill.text,
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
                        itemCount: listSkill.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 55,
                            width: width,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(children: [
                              SizedBox(
                                width: 0.8 * width,
                                height: 45,
                                child: TextFormField(
                                  controller: listSkill[index].skill,
                                  onChanged: (value) {
                                    context
                                        .read<SkillBloc>()
                                        .add(UpdateSkill(listSkill));
                                  },
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText:
                                          'Skill (E.g Design, Spreadsheets)',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 15),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(0, 5, 0, 0)),
                                ),
                              ),
                            ]),
                          );
                        })),
            SizedBox(
              height: 15,
            ),
            // add skill
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
                      listSkill.add(
                          SkillModel(skill: TextEditingController(text: "")));
                    });
                    context.read<SkillBloc>().add(UpdateSkill(listSkill));
                  },
                  child: const Text(
                    "Add SKill",
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

  removeSkillItem(int index) {
    print("${listSkill[index].skill.text}");
    setState(() {
      listSkill.remove(listSkill[index]);
    });
  }
}
