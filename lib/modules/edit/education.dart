import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  // late TextEditingController eduController = TextEditingController(text: "");
  // late TextEditingController uniController = TextEditingController(text: "");
  // late TextEditingController degreeController = TextEditingController(text: "");
  // late TextEditingController graController = TextEditingController(text: "");
  // late TextEditingController achieController = TextEditingController(text: "");

  late List<EducationModel> listEdu = [
    EducationModel(
        university: "", degree: "", grad: "", achie: "", isOpen: true)
  ];

  late List<String> titles = [
    "Education",
    "University/School",
    "Degree",
    "Graduation Year",
    "Achievement(Optional)"
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
              itemCount: listEdu.length,
              itemBuilder: (context, index) {
                return Container(
                    // color: Colors.grey.shade500,
                    // margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: listEdu[index].isOpen
                        ? Container(
                            height: 216,
                            width: width,
                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                            // color: Colors.red,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(children: [
                              // education
                              SizedBox(
                                width: 0.8 * width,
                                height: 43,
                                child: TextFormField(
                                  // controller: eduController,
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
                                            setState(() {
                                              listEdu[index].isOpen = false;
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
                                  // controller: uniController,
                                  onChanged: ((value) {
                                    setState(() {
                                      listEdu[index].university = value;
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
                                      width: 148,
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
                              // degree
                              SizedBox(
                                width: 0.8 * width,
                                height: 43,
                                child: TextFormField(
                                  // controller: degreeController,
                                  onChanged: ((value) {
                                    setState(() {
                                      listEdu[index].degree = value;
                                    });
                                  }),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Container(
                                      width: 148,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
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
                                height: 43,
                                child: TextFormField(
                                  // controller: graController,
                                  onChanged: ((value) {
                                    setState(() {
                                      listEdu[index].grad = value;
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
                                        width: 148,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 5, 0),
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
                                          const SizedBox(
                                            height: 19,
                                          ),
                                          const Icon(
                                              Icons.calendar_month_outlined),
                                        ],
                                      )),
                                ),
                              ),
                              // achieverment
                              SizedBox(
                                width: 0.8 * width,
                                height: 43,
                                child: TextFormField(
                                  // controller: achieController,
                                  onChanged: ((value) {
                                    setState(() {
                                      listEdu[index].achie = value;
                                    });
                                  }),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    prefixIcon: Container(
                                      width: 148,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
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
                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                                        width: 148,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 5, 0),
                                              child: Text(
                                                listEdu[index].university =='' ?  titles[0] :listEdu[index].university,
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
                                              listEdu[index].isOpen = true;
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
                        achie: "ryt",
                        university: "neu",
                        grad: "dfsd",
                        isOpen: false,
                        degree: "sdfsdf"));
                  });
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
  }
}
