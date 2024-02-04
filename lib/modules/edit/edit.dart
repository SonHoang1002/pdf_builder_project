import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/modules/export/preview_cv.dart';
import 'package:cv_1/tests/test_dropdownlist.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'components/all_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_1/common/const_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);


  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

// genaral var
  int inPage = 1;
  final FocusNode urlNode = FocusNode();

  late double width;

// info var

  final ScrollController _scrollController = ScrollController();

//contact var
  late TextEditingController addressController =
      TextEditingController(text: "");
  late TextEditingController phoneController = TextEditingController(text: "");
  late TextEditingController emailController = TextEditingController(text: "");
  late String titlePhone = "Phone Number";
  late String titleEmail = "Email Address";
  late String titleAddress = "Your Address";

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
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PriviewCV()));
              },
              child: Row(children: const [
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
              ]),
            )
          ],
          leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("${ConstantVariable.pathImg}home.png"))),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: Colors.grey[100],
          height: double.infinity,
          child: SafeArea(
            top: true,
            child: ListView(children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                //  height: double.infinity,
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
                                  await _scrollController.animateTo(
                                      width / 2 - 240,
                                      duration:
                                          const Duration(milliseconds: 500),
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
                                        ConstantVariable.pathImg +
                                            "profile.png",
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
                                      duration:
                                          const Duration(milliseconds: 500),
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
                                          ConstantVariable.pathImg +
                                              "contact.png",
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
                                      duration:
                                          const Duration(milliseconds: 500),
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
                                      duration:
                                          const Duration(milliseconds: 500),
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
                                      duration:
                                          const Duration(milliseconds: 500),
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
                                          ConstantVariable.pathImg +
                                              "skills.png",
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
                                      0.25 * width + 590,
                                      duration:
                                          const Duration(milliseconds: 500),
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
                                          ConstantVariable.pathImg +
                                              "summary.png",
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
                            // "Addtional"
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    inPage = 7;
                                  });
                                  await _scrollController.animateTo(
                                      0.25 * width + 800,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) {
                                        return (inPage == 7
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
                                              "additional.png",
                                          height: 20,
                                          width: 20,
                                          color: inPage == 7
                                              ? Colors.white
                                              : Colors.grey),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Additional",
                                        style: TextStyle(
                                            color: inPage == 7
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
                              child: const SizedBox(width: 90, height: 20),
                            ),
                          ]),
                    ),
                    //body
                    inPage == 1
                        ? Infomation()
                        : inPage == 2
                            ? Contact()
                            : inPage == 3
                                ? Education()
                                : inPage == 4
                                    ? Experience()
                                    : inPage == 5
                                        ? Skill()
                                        : inPage == 6
                                            ? Summary()
                                            : inPage == 7
                                                ? Additional()
                                                : Container(),

                    // navigate
                    inPage == 7 ? Container() : buildButtonBottom(),
                    // SizedBox(height: 7,)
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildButtonBottom() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: ElevatedButton(
          child: const Text(
            "Next",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            //validation
            setState(() {
              inPage++;
            });
            if (inPage > 7)
              setState(() {
                inPage = 7;
              });
            if (inPage == 1) {
              await _scrollController.animateTo(width / 2 - 180,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
            if (inPage == 2) {
              await _scrollController.animateTo(width / 2 - 80,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
            if (inPage == 3) {
              await _scrollController.animateTo(width / 2 + 75,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
            if (inPage == 4) {
              await _scrollController.animateTo(width / 2 + 220,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
            if (inPage == 5) {
              await _scrollController.animateTo(width / 2 + 360,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
            if (inPage == 6) {
              await _scrollController.animateTo(width / 2 + 500,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
            if (inPage == 7) {
              await _scrollController.animateTo(width / 2 + 640,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
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

  validation() {
    // vali contact
    if (phoneController.text.trim().length < 10) {
      _buildSnackBar(context, "Phone is invalid");
      return;
    }
    // if (addressController.text.trim().length < 10) {
    //   _buildSnackBar(context, "Address is invalid");
    //   return;
    // }
    if (ConstantVariable.regExp.hasMatch(emailController.text.trim())) {
    } else {
      _buildSnackBar(context, "Email is invalid");
      return;
    }
  }
}

_buildSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
