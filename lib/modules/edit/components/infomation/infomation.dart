import 'dart:io';

import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/test_save_value.dart';
import 'package:cv_1/models/infomation_model.dart';
import 'package:cv_1/modules/edit/components/infomation/blocs/infomation_bloc.dart';
import 'package:cv_1/modules/edit/components/infomation/blocs/infomation_event.dart';
import 'package:cv_1/modules/edit/components/infomation/blocs/infomation_state.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:cv_1/tests/test_pdf_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Infomation extends StatefulWidget {
  const Infomation({Key? key}) : super(key: key);


  @override
  State<Infomation> createState() => _InfomationState();
}

late final fullTitle = ["Full Name", "Job Title", "Date of birth(Optinal)"];
late final shortTitle = ["Full Name", "Job Title", "Date of birth"];

class _InfomationState extends State<Infomation> {
  final ScrollController _scrollController = ScrollController();

  File? _pickedImage;

  XFile? _image;

  bool isFixing = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // File imageFileFromBloc =
    //     File(BlocProvider.of<ImageAvatarCubit>(context).state.pathFile);
    return BlocBuilder<InformationBloc, InformationState>(
        builder: ((context, state) {
      final InformationModel informationModel =
          BlocProvider.of<InformationBloc>(context).state.informationModel;
      InformationRepo().setInformationRepo(informationModel);
      if (informationModel.date.text.trim().length <= 0) {
        context.read<InfoTitleBloc>().add(UpdateInfoTitleEvent(fullTitle[2]));
      } else {
        context.read<InfoTitleBloc>().add(UpdateInfoTitleEvent(shortTitle[2]));
      }
      return Container(
        height: 550,
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
                  BlocBuilder<ImageAvatarCubit, ImageFile>(
                      builder: ((context, state) {
                    return _pickedImage == null
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
                          );
                  })),
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
                        mouseCursor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return MouseCursor.defer;
                          }
                          return MouseCursor.uncontrolled;
                        }),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
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
              height: 315,
              // color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 144,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                            controller: informationModel.fullName,
                            onChanged: ((value) {
                              context.read<InformationBloc>().add(
                                  UpdateInformationEvent(informationModel));
                              InformationRepo()
                                  .setInformationRepo(informationModel);
                            }),
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
                                            color: Colors.grey[400],
                                            fontSize: 15),
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
                            controller: informationModel.jobTitle,
                            onChanged: ((value) {
                              context.read<InformationBloc>().add(
                                  UpdateInformationEvent(informationModel));
                              InformationRepo()
                                  .setInformationRepo(informationModel);
                            }),
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
                                            color: Colors.grey[400],
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // date
                        BlocBuilder<InfoTitleBloc, InfoTitleState>(
                            builder: (context, state) {
                          return SizedBox(
                            width: 0.8 * width,
                            // height: 40,
                            child: TextFormField(
                              controller: informationModel.date,
                              onChanged: ((value) {
                                context.read<InformationBloc>().add(
                                    UpdateInformationEvent(informationModel));
                                InformationRepo()
                                    .setInformationRepo(informationModel);
                              }),
                              style: TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 16, 0, 0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  prefixIcon: Container(
                                    width: context
                                                .read<InfoTitleBloc>()
                                                .state
                                                .dateTitle ==
                                            fullTitle[2]
                                        ? 146
                                        : 100,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: Text(
                                            context
                                                .read<InfoTitleBloc>()
                                                .state
                                                .dateTitle,
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
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              onDateTimeChanged: (value) {
                                                if (value != null &&
                                                    value !=
                                                        informationModel
                                                            .date.text)
                                                  setState(() {
                                                    informationModel.date.text =
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
                          );
                        }),
                      ],
                    ),
                  ),
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

                  isFixing
                      ? Container(
                        height: 80,
                        child: ReorderableListView(
                            onReorder: ((oldIndex, newIndex) {
                              if (oldIndex < newIndex) {
                                int end = newIndex - 1;
                                TextEditingController startItem =
                                    informationModel.listUrl[oldIndex];
                                int i = 0;
                                int local = oldIndex;
                                do {
                                  informationModel.listUrl[local] =
                                      informationModel.listUrl[++local];
                                  i++;
                                } while (i < end - oldIndex);
                                informationModel.listUrl[end] = startItem;
                              }
                              // dragging from bottom to top
                              else if (oldIndex > newIndex) {
                                TextEditingController startItem =
                                    informationModel.listUrl[oldIndex];
                                for (int i = oldIndex; i > newIndex; i--) {
                                  informationModel.listUrl[i] =
                                      informationModel.listUrl[i - 1];
                                }
                                informationModel.listUrl[newIndex] = startItem;
                              }
                              setState(() {});
                              context
                                  .read<InformationBloc>()
                                  .add(UpdateInformationEvent(informationModel));
                              InformationRepo()
                                  .setInformationRepo(informationModel);
                            }),
                            children: informationModel.listUrl
                                .map((e) => Container(
                                      key: Key(e.text.trim()),
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
                                                    // removeEduItem(e);
                                                    // context.read<EducationBloc>().add(
                                                    //     UpdateEducationEvent(
                                                    //         listEdu));
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
                                                  e.text,
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
                          ),
                      )
                      : Container(
                          height: 80,
                          child: ListView.builder(
                              itemCount: informationModel.listUrl.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  height: 55,
                                  width: width,
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Column(children: [
                                    SizedBox(
                                      width: 0.8 * width,
                                      height: 45,
                                      child: TextFormField(
                                        controller:
                                            informationModel.listUrl[index],
                                        onChanged: ((value) {
                                          context.read<InformationBloc>().add(
                                              UpdateInformationEvent(
                                                  informationModel));
                                        }),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: 'Type or paste URL',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 15),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                0, 5, 0, 0)),
                                      ),
                                    ),
                                  ]),
                                );
                              })),
                        ),

                  // add url
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
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
                              informationModel.listUrl
                                  .add(TextEditingController(text: "sdsfdfsd"));
                            });
                          },
                          child: const Text(
                            "Add Link",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }

  Future getImage(ImageSource src) async {
    _image = (await ImagePicker().pickImage(source: src))!;
    context.read<ImageAvatarCubit>().setPathImage(_image!.path);
    // ImageFileAvatarRepo().setAvatarPath(_image!.path);
    setState(() {
      _pickedImage = File(_image!.path);
      ImageFileAvatarRepo().setAvatarFile(File(_image!.path));
    });
  }
}

// set change for title date of birth while enter keyboard

abstract class InfoTitleState {
  final String dateTitle;
  InfoTitleState(this.dateTitle);
}

class InitInfoTitleState extends InfoTitleState {
  InitInfoTitleState() : super("Date of birth(Optinal)");
}

class SetInfoTitleState extends InfoTitleState {
  final String value;
  SetInfoTitleState(this.value) : super(value);
}

abstract class InfoTitleEvent {}

class UpdateInfoTitleEvent extends InfoTitleEvent {
  final String dateTitle;
  UpdateInfoTitleEvent(this.dateTitle) : super();
}

class InfoTitleBloc extends Bloc<InfoTitleEvent, InfoTitleState> {
  InfoTitleBloc() : super(InitInfoTitleState()) {
    on<UpdateInfoTitleEvent>(
        (event, emit) => emit(SetInfoTitleState(event.dateTitle)));
  }
}
