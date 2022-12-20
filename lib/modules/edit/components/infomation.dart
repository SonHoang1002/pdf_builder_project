import 'dart:io';

import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/models/infomation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Infomation extends StatefulWidget {
  const Infomation({super.key});

  @override
  State<Infomation> createState() => _InfomationState();
}

class _InfomationState extends State<Infomation> {
  late TextEditingController fullNameController =
      TextEditingController(text: "");
  late TextEditingController jobTitleController =
      TextEditingController(text: "");
  late TextEditingController dateController = TextEditingController(text: "");
  late List<InformationUrlModel> listInf = [
    InformationUrlModel(url: TextEditingController(text: ""))
  ];
  final ScrollController _scrollController = ScrollController();

  File? _pickedImage;
  XFile? _image;

  bool isFixing = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 515,
      child: ListView(
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
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.camera),
                                    title: const Text("Pick From Galery"),
                                    onTap: () {
                                      Navigator.of(context).pop();
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
                                      style: TextStyle(
                                          color: Colors.grey[400], fontSize: 15),
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
                                      style: TextStyle(
                                          color: Colors.grey[400], fontSize: 15),
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
                              contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0),
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
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // suffix: SizedBox(child: Image.asset(ConstantVariable.pathImg+"calendar.png"),)
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_month),
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: ((context) {
                                        return CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: (value) {
                                            if (value != null &&
                                                value != dateController.text)
                                              setState(() {
                                                dateController.text =
                                                    DateFormat("dd/MM/yyyy")
                                                        .format(value);
                                                //DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())
                                              });
                                          },
                                          initialDateTime: DateTime.now(),
                                        );
                                      }));
                                },
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("LINKS (Portfolio, Bio,..."),
                      // urlController.text.trim().length > 0
                      //     ?
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //url

                Container(
                  height: 65,
                  child: ListView.builder(
                      itemCount: listInf.length,
                      itemBuilder: ((context, index) {
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
                                controller: listInf[index].url,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Type or paste URL',
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400], fontSize: 15),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, 5, 0, 0)),
                              ),
                            ),
                          ]),
                        );
                      })),
                ),

                // add url
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
                        setState(() {
                          listInf.add(InformationUrlModel(
                              url: TextEditingController(text: "sdsfdfsd")));
                        });
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
      ),
    );
  }

  Future getImage(ImageSource src) async {
    _image = (await ImagePicker().pickImage(source: src))!;
    setState(() {
      _pickedImage = File(_image!.path);
    });
  }
}
