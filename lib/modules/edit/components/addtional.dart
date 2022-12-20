import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/Additional_model.dart';
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

  late List<String> titles = [
    "Additional",
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
  // late String listEdu[index].startTime =
  //     DateFormat("MM yyyy").format(DateTime.now()).toString();
  // late String listEdu[index].endTime = DateFormat("MM yyyy").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      height: (515 + 20*(additionalModel.listAchie.length + additionalModel.listCerti.length +additionalModel.listLang.length -3)),
      // color: Colors.yellow,
      margin: const EdgeInsets.only(top: 5),
      child: ListView(
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
            height: (400+ 20*(additionalModel.listAchie.length + additionalModel.listCerti.length +additionalModel.listLang.length -3)),
            // color: Colors.red,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                    child: additionalModel.langOpen
                        ? Container(
                            // height: additionalModel.listLang.length >2 ? 230 : additionalModel.listLang.length >1 ? 200 :160,
                            height: (180+additionalModel.listLang.length*20),
                            width: width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            // color: Colors.red,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                // color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(children: [
                              // language title
                              SizedBox(
                                width: 0.8 * width,
                                height: 43,
                                child: TextFormField(
                                  // controller: listEdu[index].university,
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
                                                  ConstantVariable.pathImg +
                                                      "languages.png"),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 5, 0),
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
                                              additionalModel.langOpen = false;
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
                              Container(
                                 height: (90+additionalModel.listLang.length*20),
                                // height: additionalModel.listLang.length >2 ? 150 : additionalModel.listLang.length >1 ? 120 : 70,
                                // color: Colors.red,
                                child: ListView.builder(
                                    itemCount: additionalModel.listLang.length,
                                    itemBuilder: (context, indexLang) {
                                      return Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // language input
                                            Container(
                                              width: 0.5 * width,
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 0, 5, 0),
                                              height: 43,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.grey[300]),
                                              child: Center(
                                                child: SizedBox(
                                                  height: 43,
                                                  width: width * 0.4655,
                                                  child: TextFormField(
                                                    controller: additionalModel
                                                        .listLang[indexLang]
                                                        .language,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    decoration: InputDecoration(
                                                        hintText: "Language",
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 0, 0, 3),
                                                        fillColor:
                                                            Colors.grey[300],
                                                        filled: true,
                                                        border:
                                                            InputBorder.none),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //level input
                                            Container(
                                              width: 0.3 * width,
                                              height: 43,
                                              margin: EdgeInsets.fromLTRB(
                                                  5, 0, 10, 0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.grey[300]),
                                              child: Center(
                                                child: SizedBox(
                                                  height: 43,
                                                  width: width * 0.2655,
                                                  child: TextFormField(
                                                    controller: additionalModel
                                                        .listLang[indexLang]
                                                        .level,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    decoration: InputDecoration(
                                                        hintText: "Level",
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 0, 0, 3),
                                                        fillColor:
                                                            Colors.grey[300],
                                                        filled: true,
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
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: Image.asset(
                                            ConstantVariable.pathImg +
                                                "icon_add.png"),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            additionalModel.listLang.add(
                                                Language(
                                                    TextEditingController(
                                                        text: ""),
                                                    TextEditingController(
                                                        text: "")));
                                          });
                                        },
                                        child: const Text(
                                          "Add Language",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]))
                        : Container(
                            width: width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
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
                                              additionalModel.langOpen = true;
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
        ],
      ),
    );
  }

  double _buildHeightForLanguageElement() {
    double height = 100;
    return height;
  }

  // void _buildTime(int index) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: ((context) {
  //         return BottomSheet(
  //             onClosing: (() {}),
  //             builder: ((context) {
  //               return StatefulBuilder(builder: (context, setState) {
  //                 late String gradValue = "";
  //                 return Container(
  //                   height: 600,
  //                   // width: double.infinity,
  //                   color: Colors.grey[350],
  //                   //  color: Colors.red,
  //                   child: Column(
  //                     children: [
  //                       // work period
  //                       Container(
  //                         margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             GestureDetector(
  //                               onTap: () {
  //                                 Navigator.of(context).pop();
  //                               },
  //                               child: Container(
  //                                 height: 20,
  //                                 width: 20,
  //                                 // margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
  //                                 child: Image.asset(
  //                                     ConstantVariable.pathImg + "close.png"),
  //                               ),
  //                             ),
  //                             Center(
  //                               child: Text("Graduation Year"),
  //                             ),
  //                             GestureDetector(
  //                               onTap: () {
  //                                 setState(() => listEdu[index].grad.text =
  //                                     DateFormat("MM yyyy")
  //                                             .format(listEdu[index].startTime)
  //                                             .toString() +
  //                                         " - " +
  //                                         DateFormat("MM yyyy")
  //                                             .format(listEdu[index].endTime)
  //                                             .toString());
  //                                 Navigator.of(context).pop();
  //                               },
  //                               child: Text(
  //                                 "Done",
  //                                 style: TextStyle(
  //                                     color: Colors.blue,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       ),

  //                       // present working
  //                       Container(
  //                         width: width * 0.9,
  //                         height: 50,
  //                         margin: EdgeInsets.symmetric(vertical: 10),
  //                         decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(20))),
  //                         child: Center(
  //                             child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Container(
  //                                 margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
  //                                 child: Text("Present working here")),
  //                             CupertinoSwitch(
  //                                 value: isPresent,
  //                                 onChanged: ((value) {
  //                                   setState(() {
  //                                     isPresent = !isPresent;
  //                                   });
  //                                 }))
  //                           ],
  //                         )),
  //                       ),

  //                       // pick date
  //                       Container(
  //                         height: 90,
  //                         width: 400,
  //                         margin: EdgeInsets.symmetric(
  //                           horizontal: 20,
  //                         ),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             //start date
  //                             GestureDetector(
  //                               onTap: () {
  //                                 setState(() => isBeginPeriod = true);
  //                               },
  //                               child: Container(
  //                                 height: 90,
  //                                 width: width * 0.44,
  //                                 // color: Colors.red,
  //                                 decoration: BoxDecoration(
  //                                     color: Colors.white,
  //                                     borderRadius: BorderRadius.all(
  //                                         Radius.circular(20))),
  //                                 child: Column(
  //                                   children: [
  //                                     // title start date
  //                                     Container(
  //                                       margin:
  //                                           EdgeInsets.only(left: 15, top: 10),
  //                                       child: Row(
  //                                         children: [
  //                                           Text(
  //                                             "Start Date",
  //                                             style: TextStyle(
  //                                                 fontSize: 15,
  //                                                 color: Colors.blue),
  //                                           )
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     // pick start date
  //                                     Container(
  //                                       height: 40,
  //                                       margin: EdgeInsets.symmetric(
  //                                           horizontal: 10, vertical: 10),
  //                                       decoration: BoxDecoration(
  //                                           border: Border.all(
  //                                             color: Colors.grey,
  //                                             // width: 2,
  //                                           ),
  //                                           borderRadius: BorderRadius.all(
  //                                               Radius.circular(15)),
  //                                           color: isBeginPeriod
  //                                               ? Colors.blue
  //                                               : Colors.white),
  //                                       child: Container(
  //                                         margin:
  //                                             EdgeInsets.fromLTRB(10, 0, 10, 0),
  //                                         child: Center(
  //                                           child: Row(
  //                                             children: [
  //                                               Container(
  //                                                 padding: EdgeInsets.fromLTRB(
  //                                                     0, 0, 0, 0),
  //                                                 child: GestureDetector(
  //                                                   onTap: () {
  //                                                     ///
  //                                                   },
  //                                                   child: SizedBox(
  //                                                     height: 20,
  //                                                     width: 20,
  //                                                     child: isBeginPeriod
  //                                                         ? Image.asset(
  //                                                             ConstantVariable
  //                                                                     .pathImg +
  //                                                                 "calendar_light.png")
  //                                                         : Image.asset(
  //                                                             ConstantVariable
  //                                                                     .pathImg +
  //                                                                 "calendar_dark.png"),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               SizedBox(
  //                                                 width: 10,
  //                                               ),
  //                                               Text(
  //                                                 // endPeriodController.text
  //                                                 //     .trim(),
  //                                                 DateFormat("MM yyyy")
  //                                                     .format(listEdu[index]
  //                                                         .startTime)
  //                                                     .toString(),

  //                                                 style: TextStyle(
  //                                                     fontSize: 17,
  //                                                     color: isBeginPeriod
  //                                                         ? Colors.white
  //                                                         : Colors.grey),
  //                                               )
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     )
  //                                   ],
  //                                 ),
  //                               ),
  //                             ),

  //                             //end date
  //                             GestureDetector(
  //                               onTap: () {
  //                                 setState(() => isBeginPeriod = false);
  //                               },
  //                               child: Container(
  //                                 height: 90,
  //                                 width: width * 0.44,
  //                                 // color: Colors.red,
  //                                 decoration: BoxDecoration(
  //                                     color: Colors.white,
  //                                     borderRadius: BorderRadius.all(
  //                                         Radius.circular(20))),
  //                                 child: Column(
  //                                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     // title end date
  //                                     Container(
  //                                       margin:
  //                                           EdgeInsets.only(left: 15, top: 10),
  //                                       child: Row(
  //                                         children: [
  //                                           Text(
  //                                             "End Date",
  //                                             style: TextStyle(
  //                                                 fontSize: 15,
  //                                                 color: Colors.blue),
  //                                           )
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     // pick end date
  //                                     Container(
  //                                       height: 40,
  //                                       margin: EdgeInsets.symmetric(
  //                                           horizontal: 10, vertical: 10),
  //                                       decoration: BoxDecoration(
  //                                           border: Border.all(
  //                                             color: Colors.grey,
  //                                             // width: 2,
  //                                           ),
  //                                           borderRadius: BorderRadius.all(
  //                                               Radius.circular(15)),
  //                                           color: !isBeginPeriod
  //                                               ? Colors.blue
  //                                               : Colors.white),
  //                                       child: Container(
  //                                         margin:
  //                                             EdgeInsets.fromLTRB(10, 0, 10, 0),
  //                                         child: Center(
  //                                           child: Row(
  //                                             children: [
  //                                               Container(
  //                                                 padding: EdgeInsets.fromLTRB(
  //                                                     0, 0, 0, 0),
  //                                                 child: GestureDetector(
  //                                                   onTap: () {
  //                                                     ///
  //                                                   },
  //                                                   child: SizedBox(
  //                                                     height: 20,
  //                                                     width: 20,
  //                                                     child: !isBeginPeriod
  //                                                         ? Image.asset(
  //                                                             ConstantVariable
  //                                                                     .pathImg +
  //                                                                 "calendar_light.png")
  //                                                         : Image.asset(
  //                                                             ConstantVariable
  //                                                                     .pathImg +
  //                                                                 "calendar_dark.png"),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               SizedBox(
  //                                                 width: 10,
  //                                               ),
  //                                               Text(
  //                                                 DateFormat("MM yyyy")
  //                                                     .format(listEdu[index]
  //                                                         .endTime)
  //                                                     .toString(),
  //                                                 // "End",
  //                                                 style: TextStyle(
  //                                                     fontSize: 17,
  //                                                     color: !isBeginPeriod
  //                                                         ? Colors.white
  //                                                         : Colors.grey),
  //                                               )
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     )
  //                                   ],
  //                                 ),
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       ),

  //                       //choose date from datePicker
  //                       Container(
  //                         height: 230,
  //                         width: width * 0.9,
  //                         margin: EdgeInsets.only(top: 20),
  //                         decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(20))),
  //                         child: Center(
  //                           child: CupertinoDatePicker(
  //                             mode: CupertinoDatePickerMode.date,
  //                             onDateTimeChanged: (value) {
  //                               print(value);
  //                               if (isBeginPeriod) {
  //                                 setState(
  //                                     () => listEdu[index].startTime = value);
  //                               } else {
  //                                 setState(
  //                                     () => listEdu[index].endTime = value);
  //                               }
  //                             },
  //                             initialDateTime: isBeginPeriod
  //                                 ? listEdu[index].startTime
  //                                 : listEdu[index].endTime,
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 );
  //               });
  //             }));
  //       }));
  // }

  // void removeEduItem(AdditionalModel model) {
  //   print(
  //       "${model.university.text} - ${model.degree.text} - ${model.grad.text} - ${model.achie.text} ");
  //   setState(() {
  //     listEdu.remove(model);
  //   });
  // }
}
