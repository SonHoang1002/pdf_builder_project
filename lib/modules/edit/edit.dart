import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/modules/edit/education.dart';
import 'package:cv_1/modules/edit/experience.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

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
  late TextEditingController fullNameController =
      TextEditingController(text: "");
  late TextEditingController jobTitleController =
      TextEditingController(text: "");
  late TextEditingController dateController = TextEditingController(text: "");
  late TextEditingController urlController = TextEditingController(text: "");
  final ScrollController _scrollController = ScrollController();

  File? _pickedImage;
  XFile? _image;

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
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: Colors.grey.shade400,
          child: SafeArea(
            top: true,
            child: ListView(children: [
              Container(
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
                                      0.25 * width + 600,
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
                            //empty
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                              child: const SizedBox(width: 130, height: 20),
                            ),
                          ]),
                    ),
                    //body
                    inPage == 1
                        ? _buildInfoBody()
                        : inPage == 2
                            ? _buildContactBody()
                            : inPage==3
                              ? Education()
                              :inPage ==4
                                ? Experience()
                                :Container(),

                    // navigate
                    buildButtonBottom(),
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

  Widget _buildInfoBody() {
    return Column(
      children: [
        Container(
          height: 230,
          padding: const EdgeInsets.only(top: 15),
          // color: Colors.red,
          child: Center(
              child: Column(
            children: [
              //image
              _pickedImage == null
                  ? Container(
                      height: 167,
                      child: Image.asset(
                        ConstantVariable.listOfImage[1],
                      ))
                  : Container(
                      height: 167,
                      child: CircleAvatar(
                          maxRadius: 60,
                          backgroundImage: FileImage(_pickedImage!)),
                    ),
              //edit button
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.camera),
                                  title: const Text("Pick From Camera"),
                                  onTap: () {
                                    getImage(ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.camera),
                                  title: const Text("Pick From Galery"),
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
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
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
              )
            ],
          )),
        ),
        //input tags
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 305,
          // color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 144,
                width: double.infinity,
                margin: EdgeInsets.all(20),
                // color: Colors.red,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    //name
                    SizedBox(
                      width: 0.8 * width,
                      // height: 40,
                      child: TextFormField(
                        controller: fullNameController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Container(
                            width: 100,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(
                                    'Full name',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //job
                    SizedBox(
                      width: 0.8 * width,
                      // height: 40,
                      child: TextFormField(
                        controller: jobTitleController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Container(
                            width: 100,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(
                                    'Job Title',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // date
                    SizedBox(
                      width: 0.8 * width,
                      // height: 40,
                      child: TextFormField(
                        controller: dateController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Container(
                            width: 100,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(
                                    'Date of birth',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("LINKS (Portfolio, Bio,..."),
                    urlController.text.trim().length > 0
                        ? GestureDetector(
                            child: const Text(
                              "Edit",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            onTap: () {
                              urlNode.requestFocus();
                            })
                        : Container()
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //url
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  focusNode: urlNode,
                  controller: urlController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Container(
                      height: 20,
                      width: 20,
                      child: Image.asset(ConstantVariable.pathImg + "icon.png"),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "Type or paste URL",
                    // labelText: "Username",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child:
                        Image.asset(ConstantVariable.pathImg + "icon_add.png"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      urlNode.requestFocus();
                    },
                    child: const Text(
                      "Add Link",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactBody() {
    return Container(
      height: 515,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          //input tags
          Container(
            height: 275,
            // color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //title contact details
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("CONTACT DETAILS"),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                // contact detail body
                Container(
                  height: 96,
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      //phone
                      SizedBox(
                        width: 0.8 * width,
                        // height: 40,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CustomInputFormatter()
                          ],
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (phoneController.text.trim().length > 0) {
                              setState(() {
                                titlePhone = "Phone";
                              });
                              return;
                            } else {
                              setState(() {
                                titlePhone = "Phone Number";
                              });
                            }
                          },
                          controller: phoneController,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Container(
                              width: 100,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Text(
                                      titlePhone,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // email
                      SizedBox(
                        width: 0.8 * width,
                        // height: 40,
                        child: TextFormField(
                          controller: emailController,
                          onChanged: (value) {
                            if (emailController.text.trim().length > 0) {
                              setState(() {
                                titleEmail = "Email";
                              });
                              return;
                            }
                              setState(() {
                                titleEmail = "Email Address";
                              });
                              return;
                          },
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            prefixIcon: Container(
                              width: 100,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Text(
                                      titleEmail,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("ADDRESS"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //address
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: addressController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    onChanged: (value) {
                            if (addressController.text.trim().length > 0) {
                              setState(() {
                                titleAddress = "Address";
                              });
                              return;
                            }
                              setState(() {
                                titleAddress = "Your Address";
                              });
                              return;
                          },
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        width: 100,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                              child: Text(
                               titleAddress,
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future getImage(ImageSource src) async {
    _image = (await ImagePicker().pickImage(source: src))!;
    setState(() {
      _pickedImage = File(_image!.path);
    });
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
            if (inPage > 6)
              setState(() {
                inPage = 6;
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
