import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  late TextEditingController fullNameController =
      TextEditingController(text: "");
  late TextEditingController jobTitleController =
      TextEditingController(text: "");
  late TextEditingController dateController = TextEditingController(text: "");
  late TextEditingController urlController = TextEditingController(text: "");
  final ScrollController _scrollController = ScrollController();
  int inPage = 1;

  late double width;
  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Center(
              child: Container(
                  margin: const EdgeInsets.only(left: 35),
                  child: const Text("INFORMATION",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold)))),
          actions: [
            Row(children: const [
              SizedBox(
                width: 30,
              ),
              Center(
                child: Text(
                  "Preview",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ])
          ],
          leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("${ConstantVariable.pathImg}home.png"))),
      body: Container(
        color: Colors.grey,
        child: SafeArea(
          top: true,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ListView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        //empty
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: const SizedBox(width: 100, height: 20),
                        ),
                        // "Info"
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                inPage = 1;
                              });
                              await _scrollController.animateTo(width / 2 - 240,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    return (inPage == 1
                                        ? Colors.blue
                                        : Colors.white);
                                  },
                                ),
                                fixedSize: MaterialStateProperty.resolveWith(
                                    (states) => const Size(100, 20)),
                                side: MaterialStateProperty.resolveWith(
                                    (states) => const BorderSide(
                                        color: Colors.transparent)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.transparent)))),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                    ConstantVariable.pathImg + "profile.png",
                                    height: 20,
                                    width: 20,
                                    color: inPage == 1
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Info",
                                    style: TextStyle(
                                        color: inPage == 1
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // "Contact",
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                inPage = 2;
                              });
                              await _scrollController.animateTo(
                                  0.25 * width + 20,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    return (inPage == 2
                                        ? Colors.blue
                                        : Colors.white);
                                  },
                                ),
                                fixedSize: MaterialStateProperty.resolveWith(
                                    (states) => const Size(116, 20)),
                                side: MaterialStateProperty.resolveWith(
                                    (states) => const BorderSide(
                                        color: Colors.transparent)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.transparent)))),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                      ConstantVariable.pathImg + "contact.png",
                                      height: 20,
                                      width: 20,
                                      color: inPage == 2
                                          ? Colors.white
                                          : Colors.grey),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Contact",
                                    style: TextStyle(
                                        color: inPage == 2
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // "Education",
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                inPage = 3;
                              });
                              await _scrollController.animateTo(
                                  0.25 * width + 160,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    return (inPage == 3
                                        ? Colors.blue
                                        : Colors.white);
                                  },
                                ),
                                fixedSize: MaterialStateProperty.resolveWith(
                                    (states) => const Size(130, 20)),
                                side: MaterialStateProperty.resolveWith(
                                    (states) => const BorderSide(
                                        color: Colors.transparent)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.transparent)))),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                      ConstantVariable.pathImg +
                                          "education.png",
                                      height: 20,
                                      width: 20,
                                      color: inPage == 3
                                          ? Colors.white
                                          : Colors.grey),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Education",
                                    style: TextStyle(
                                        color: inPage == 3
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // "Experience",
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                inPage = 4;
                              });
                              await _scrollController.animateTo(
                                  0.25 * width + 320,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    return (inPage == 4
                                        ? Colors.blue
                                        : Colors.white);
                                  },
                                ),
                                fixedSize: MaterialStateProperty.resolveWith(
                                    (states) => const Size(140, 20)),
                                side: MaterialStateProperty.resolveWith(
                                    (states) => const BorderSide(
                                        color: Colors.transparent)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.transparent)))),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                      ConstantVariable.pathImg +
                                          "experience.png",
                                      height: 20,
                                      width: 20,
                                      color: inPage == 4
                                          ? Colors.white
                                          : Colors.grey),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Experience",
                                    style: TextStyle(
                                        color: inPage == 4
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // "Skill",
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                inPage = 5;
                              });
                              await _scrollController.animateTo(
                                  0.25 * width + 460,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    return (inPage == 5
                                        ? Colors.blue
                                        : Colors.white);
                                  },
                                ),
                                fixedSize: MaterialStateProperty.resolveWith(
                                    (states) => const Size(100, 20)),
                                side: MaterialStateProperty.resolveWith(
                                    (states) => const BorderSide(
                                        color: Colors.transparent)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.transparent)))),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                      ConstantVariable.pathImg + "skills.png",
                                      height: 20,
                                      width: 20,
                                      color: inPage == 5
                                          ? Colors.white
                                          : Colors.grey),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Skill",
                                    style: TextStyle(
                                        color: inPage == 5
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // "Summary"
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                inPage = 6;
                              });
                              await _scrollController.animateTo(
                                  0.25 * width + 600,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    return (inPage == 6
                                        ? Colors.blue
                                        : Colors.white);
                                  },
                                ),
                                fixedSize: MaterialStateProperty.resolveWith(
                                    (states) => const Size(130, 20)),
                                side: MaterialStateProperty.resolveWith(
                                    (states) => const BorderSide(
                                        color: Colors.transparent)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.transparent)))),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                      ConstantVariable.pathImg + "summary.png",
                                      height: 20,
                                      width: 20,
                                      color: inPage == 6
                                          ? Colors.white
                                          : Colors.grey),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Summary",
                                    style: TextStyle(
                                        color: inPage == 6
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //empty
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                          child: const SizedBox(width: 130, height: 20),
                        ),
                      ]),
                ),
                //body
                // _buildInfoBody(),

                // navigate
                buildButtonBottom(),
                // SizedBox(height: 7,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonBottom() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
          child: Text(
            "Next",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            setState(() {
              inPage++;
            });
            if (inPage > 6)
              setState(() {
                inPage = 6;
              });
            if (inPage == 1) {
              await _scrollController.animateTo(width / 2 - 180,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }
             if (inPage ==2) {
              await _scrollController.animateTo(width / 2 -80,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }
             if (inPage == 3) {
              await _scrollController.animateTo(width / 2+75,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }
             if (inPage == 4) {
              await _scrollController.animateTo(width / 2+220,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }
             if (inPage == 5) {
              await _scrollController.animateTo(width / 2 +360,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }
             if (inPage == 6) {
              await _scrollController.animateTo(width / 2 +500,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              fixedSize: MaterialStateProperty.resolveWith(
                  (states) => const Size(250, 55)),
              side: MaterialStateProperty.resolveWith(
                  (states) => const BorderSide(color: Colors.transparent)),
              mouseCursor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return MouseCursor.defer;
                }
                return MouseCursor.uncontrolled;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      side: const BorderSide(color: Colors.white)))),
        ),
      ),
    );
  }

  Widget _buildInfoBody() {
    return Column(
      children: [
        Container(
          height: 230,
          padding: EdgeInsets.only(top: 15),
          // color: Colors.red,
          child: Center(
              child: Column(
            children: [
              Container(
                  height: 167,
                  child: Image.asset(
                    "${ConstantVariable.listOfImage[1]}",
                  )),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    fixedSize: MaterialStateProperty.resolveWith(
                        (states) => const Size(70, 20)),
                    side: MaterialStateProperty.resolveWith((states) =>
                        const BorderSide(color: Colors.transparent)),
                    mouseCursor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return MouseCursor.defer;
                      }
                      return MouseCursor.uncontrolled;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                            side: const BorderSide(color: Colors.white)))),
                child: Text(
                  "Edit",
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
              )
            ],
          )),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          height: 250,
          // color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Full Name",
                  // labelText: "Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              TextFormField(
                controller: jobTitleController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(0.01))),
                  hintText: "Job title",
                  // labelText: "Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: GestureDetector(
                      child: Icon(Icons.calendar_month),
                      onTap: () async {
                        showModalBottomSheet(
                            context: context,
                            builder: ((context) {
                              return Container(
                                height: 200,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (value) {
                                    if (value != null &&
                                        value != dateController.text)
                                      setState(() {
                                        dateController.text =
                                            DateFormat("yyyy-MM-dd")
                                                .format(value);
                                      });
                                  },
                                  initialDateTime: DateTime.now(),
                                ),
                              );
                            }));
                      }),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Date of birth",
                  // labelText: "Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("LINKS (Portfolio, Bio,..."),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: urlController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Container(
                    height: 20,
                    width: 20,
                    child: Image.asset(ConstantVariable.pathImg + "icon.png"),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Type or paste URL",
                  // labelText: "Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}





// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:cv_1/common/const_var.dart';
// import 'package:cv_1/widgets/button_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';

// class Edit extends StatefulWidget {
//   const Edit({super.key});

//   @override
//   State<Edit> createState() => _EditState();
// }

// class _EditState extends State<Edit> {
//   final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
//   late bool isSkill = false;
//   late bool isEpx = false;
//   late bool isInfo = true;
//   late bool isContact = false;
//   late bool isEdu = false;
//   late bool isSum = false;
//   late TextEditingController fullNameController =
//       TextEditingController(text: "");
//   late TextEditingController jobTitleController =
//       TextEditingController(text: "");
//   late TextEditingController dateController = TextEditingController(text: "");
//   late TextEditingController urlController = TextEditingController(text: "");

//   int inPage = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _key,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//           title: Center(
//               child: Container(
//                   margin: const EdgeInsets.only(left: 35),
//                   child: const Text("INFORMATION",
//                       style: TextStyle(
//                           fontSize: 17, fontWeight: FontWeight.bold)))),
//           actions: [
//             Row(children: const [
//               SizedBox(
//                 width: 30,
//               ),
//               Center(
//                 child: Text(
//                   "Preview",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               )
//             ])
//           ],
//           leading: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Image.asset("${ConstantVariable.pathImg}home.png"))),
//       body: Container(
//         color: Colors.grey,
//         child: SafeArea(
//           top: true,
//           child: Container(
//             margin: const EdgeInsets.only(top: 10),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: 45,
//                   width: double.infinity,
//                   child: ListView(scrollDirection: Axis.horizontal, children: [
//                     // "Info"
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isSkill = false;
//                             isEpx = false;
//                             isInfo = true;
//                             isContact = false;
//                             isEdu = false;
//                             isSum = false;
//                             inPage = 1;
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.resolveWith(
//                               (states) {
//                                 return (isInfo ? Colors.blue : Colors.white);
//                               },
//                             ),
//                             fixedSize: MaterialStateProperty.resolveWith(
//                                 (states) => const Size(100, 20)),
//                             side: MaterialStateProperty.resolveWith((states) =>
//                                 const BorderSide(color: Colors.transparent)),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: const BorderSide(
//                                         color: Colors.transparent)))),
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                 ConstantVariable.pathImg + "profile.png",
//                                 height: 20,
//                                 width: 20,
//                                 color: isInfo ? Colors.white : Colors.grey,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "Info",
//                                 style: TextStyle(
//                                     color: isInfo ? Colors.white : Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // "Contact",
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isSkill = false;
//                             isEpx = false;
//                             isInfo = false;
//                             isContact = true;
//                             isEdu = false;
//                             isSum = false;
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.resolveWith(
//                               (states) {
//                                 return (isContact ? Colors.blue : Colors.white);
//                               },
//                             ),
//                             fixedSize: MaterialStateProperty.resolveWith(
//                                 (states) => const Size(116, 20)),
//                             side: MaterialStateProperty.resolveWith((states) =>
//                                 const BorderSide(color: Colors.transparent)),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: const BorderSide(
//                                         color: Colors.transparent)))),
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                   ConstantVariable.pathImg + "contact.png",
//                                   height: 20,
//                                   width: 20,
//                                   color:
//                                       isContact ? Colors.white : Colors.grey),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "Contact",
//                                 style: TextStyle(
//                                     color:
//                                         isContact ? Colors.white : Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // "Education",
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isSkill = false;
//                             isEpx = false;
//                             isInfo = false;
//                             isContact = false;
//                             isEdu = true;
//                             isSum = false;
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.resolveWith(
//                               (states) {
//                                 return (isEdu ? Colors.blue : Colors.white);
//                               },
//                             ),
//                             fixedSize: MaterialStateProperty.resolveWith(
//                                 (states) => const Size(130, 20)),
//                             side: MaterialStateProperty.resolveWith((states) =>
//                                 const BorderSide(color: Colors.transparent)),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: const BorderSide(
//                                         color: Colors.transparent)))),
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                   ConstantVariable.pathImg + "education.png",
//                                   height: 20,
//                                   width: 20,
//                                   color: isEdu ? Colors.white : Colors.grey),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "Education",
//                                 style: TextStyle(
//                                     color: isEdu ? Colors.white : Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // "Experience",
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isSkill = false;
//                             isEpx = true;
//                             isInfo = false;
//                             isContact = false;
//                             isEdu = false;
//                             isSum = false;
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.resolveWith(
//                               (states) {
//                                 return (isEpx ? Colors.blue : Colors.white);
//                               },
//                             ),
//                             fixedSize: MaterialStateProperty.resolveWith(
//                                 (states) => const Size(140, 20)),
//                             side: MaterialStateProperty.resolveWith((states) =>
//                                 const BorderSide(color: Colors.transparent)),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: const BorderSide(
//                                         color: Colors.transparent)))),
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                   ConstantVariable.pathImg + "experience.png",
//                                   height: 20,
//                                   width: 20,
//                                   color: isEpx ? Colors.white : Colors.grey),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "Experience",
//                                 style: TextStyle(
//                                     color: isEpx ? Colors.white : Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // "Skill",
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isSkill = true;
//                             isEpx = false;
//                             isInfo = false;
//                             isContact = false;
//                             isEdu = false;
//                             isSum = false;
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.resolveWith(
//                               (states) {
//                                 return (isSkill ? Colors.blue : Colors.white);
//                               },
//                             ),
//                             fixedSize: MaterialStateProperty.resolveWith(
//                                 (states) => const Size(100, 20)),
//                             side: MaterialStateProperty.resolveWith((states) =>
//                                 const BorderSide(color: Colors.transparent)),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: const BorderSide(
//                                         color: Colors.transparent)))),
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                   ConstantVariable.pathImg + "skills.png",
//                                   height: 20,
//                                   width: 20,
//                                   color: isSkill ? Colors.white : Colors.grey),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "Skill",
//                                 style: TextStyle(
//                                     color:
//                                         isSkill ? Colors.white : Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // "Summary"
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             isSkill = false;
//                             isEpx = false;
//                             isInfo = false;
//                             isContact = false;
//                             isEdu = false;
//                             isSum = true;
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.resolveWith(
//                               (states) {
//                                 return (isSum ? Colors.blue : Colors.white);
//                               },
//                             ),
//                             fixedSize: MaterialStateProperty.resolveWith(
//                                 (states) => const Size(130, 20)),
//                             side: MaterialStateProperty.resolveWith((states) =>
//                                 const BorderSide(color: Colors.transparent)),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: const BorderSide(
//                                         color: Colors.transparent)))),
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Image.asset(
//                                   ConstantVariable.pathImg + "summary.png",
//                                   height: 20,
//                                   width: 20,
//                                   color: isSum ? Colors.white : Colors.grey),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "Summary",
//                                 style: TextStyle(
//                                     color: isSum ? Colors.white : Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 //body
//                 _buildInfoBody(),

//                 // navigate
//                 ButtonWidget()
//                     .buildButtonBottom(title: "Next", action: () {}, top: 30),
//                 // SizedBox(height: 7,)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoBody() {
//     return Column(
//       children: [
//         Container(
//           height: 230,
//           padding: EdgeInsets.only(top: 15),
//           // color: Colors.red,
//           child: Center(
//               child: Column(
//             children: [
//               Container(
//                   height: 167,
//                   child: Image.asset(
//                     "${ConstantVariable.listOfImage[1]}",
//                   )),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.grey),
//                     fixedSize: MaterialStateProperty.resolveWith(
//                         (states) => const Size(70, 20)),
//                     side: MaterialStateProperty.resolveWith((states) =>
//                         const BorderSide(color: Colors.transparent)),
//                     mouseCursor: MaterialStateProperty.resolveWith((states) {
//                       if (states.contains(MaterialState.hovered)) {
//                         return MouseCursor.defer;
//                       }
//                       return MouseCursor.uncontrolled;
//                     }),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(35.0),
//                             side: const BorderSide(color: Colors.white)))),
//                 child: Text(
//                   "Edit",
//                   style: TextStyle(color: Colors.blue, fontSize: 17),
//                 ),
//               )
//             ],
//           )),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
//           height: 250,
//           // color: Colors.black,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: fullNameController,
//                 decoration: const InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10)),
//                       borderSide: BorderSide(color: Colors.white)),
//                   hintText: "Full Name",
//                   // labelText: "Username",
//                   hintStyle: TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(),
//                   isDense: true,
//                   contentPadding: EdgeInsets.all(12),
//                 ),
//               ),
//               TextFormField(
//                 controller: jobTitleController,
//                 decoration: const InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                       borderRadius: BorderRadius.all(Radius.circular(0.01))),
//                   hintText: "Job title",
//                   // labelText: "Username",
//                   hintStyle: TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(),
//                   isDense: true,
//                   contentPadding: EdgeInsets.all(12),
//                 ),
//               ),
//               TextFormField(
//                 controller: dateController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   suffixIcon: GestureDetector(
//                       child: Icon(Icons.calendar_month),
//                       onTap: () async {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: ((context) {
//                               return Container(
//                                 height: 200,
//                                 child: CupertinoDatePicker(
//                                   mode: CupertinoDatePickerMode.date,
//                                   onDateTimeChanged: (value) {
//                                     if (value != null &&
//                                         value != dateController.text)
//                                       setState(() {
//                                         dateController.text =
//                                             DateFormat("yyyy-MM-dd")
//                                                 .format(value);
//                                       });
//                                   },
//                                   initialDateTime: DateTime.now(),
//                                 ),
//                               );
//                             }));
//                       }),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(10),
//                           bottomRight: Radius.circular(10)),
//                       borderSide: BorderSide(color: Colors.white)),
//                   hintText: "Date of birth",
//                   // labelText: "Username",
//                   hintStyle: TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(),
//                   isDense: true,
//                   contentPadding: EdgeInsets.all(12),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 children: [
//                   Text("LINKS (Portfolio, Bio,..."),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: urlController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   suffixIcon: Container(
//                     height: 20,
//                     width: 20,
//                     child: Image.asset(ConstantVariable.pathImg + "icon.png"),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white)),
//                   hintText: "Type or paste URL",
//                   // labelText: "Username",
//                   hintStyle: TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(),
//                   isDense: true,
//                   contentPadding: EdgeInsets.all(12),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
