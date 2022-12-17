import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/experience_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  late List<ExperienceModel> listExp = [
    ExperienceModel(work: "", job: "", period: "", desc: "", isOpen: true)
  ];

  late List<String> titles = [
    "Work Experience",
    "Job Title",
    "Work Period",
    "Description",
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 515,
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          //input tags
          Container(
            height: 400,
            margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: ListView.builder(
              itemCount: listExp.length,
              itemBuilder: (context, index) {
                return Container(
                    // color: Colors.grey.shade500,
                    // margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: listExp[index].isOpen
                        ? Container(
                            height:
                                listExp[index].desc.length <= 20 ? 174 : 340,
                            width: width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            // color: Colors.red,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(children: [
                              // experience
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
                                        width: 111,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 5, 0),
                                              child: Text(
                                                titles[0],
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
                                            ExperienceModel a = listExp[index];
                                            print(a.toString);
                                            listExp.remove(a);
                                            a.isOpen = false;
                                            setState(() {
                                              listExp.add(a);
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
                              // job title
                              SizedBox(
                                width: 0.8 * width,
                                height: 43,
                                child: TextFormField(
                                  // controller: uniController,
                                  onChanged: ((value) {
                                    setState(() {
                                      listExp[index].job = value;
                                    });
                                  }),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(0, 9, 0, 0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Container(
                                      width: 111,
                                      child: Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
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
                              // work period
                              SizedBox(
                                width: 0.8 * width,
                                height: 43,
                                child: TextFormField(
                                  // controller: graController,
                                  onChanged: ((value) {
                                    setState(() {
                                      listExp[index].period = value;
                                    });
                                  }),
                                  readOnly: true,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Container(
                                        width: 111,
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
                                      suffix: Column(
                                        children: [
                                          const SizedBox(
                                            height: 19,
                                          ),
                                          const Icon(
                                              Icons.calendar_month_outlined),
                                        ],
                                      )),
                                ),
                              ),
                              //Description
                              SizedBox(
                                width: 0.8 * width,
                                height:
                                    listExp[index].desc.length <= 20 ? 43 : 200,
                                child: TextFormField(
                                  onChanged: ((value) {
                                    setState(() {
                                      listExp[index].desc = value;
                                    });
                                  }),
                                  // expands: true,
                                  // maxLines: null,
                                  maxLines: 10,
                                  // minLines: 0,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: listExp[index].desc.length <=
                                              20
                                          ? Container(
                                              width: 111,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                        width: 111,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 5, 0),
                                              child: Text(
                                                listExp[index].job == ''
                                                    ? titles[0]
                                                    : listExp[index].job,
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
                                            ExperienceModel a = listExp[index];
                                            print(a);
                                            listExp.remove(a);
                                            a.isOpen = true;
                                            setState(() {
                                              listExp.add(a);
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
                child: Image.asset(ConstantVariable.pathImg + "icon_add.png"),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    listExp.add(ExperienceModel(
                        work: "ryt",
                        job: "neu",
                        desc: "dfsd",
                        isOpen: false,
                        period: "sdfsdf"));
                  });
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
  }
}
