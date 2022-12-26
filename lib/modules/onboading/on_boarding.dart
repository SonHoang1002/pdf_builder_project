import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late bool isAll = true, isSimple = false, isModern = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("isAll : ${isAll}, isSimple : ${isSimple}, isModern : ${isModern}");
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Choose Templates"))),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            // Image.asset("${ConstantVariable.pathImg}cv_img_1.jpg",height: 120,width: 60,),
            Container(
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //all
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAll = true;
                        isModern = false;
                        isSimple = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return (isAll ? Colors.blue : Colors.white);
                          },
                        ),
                        fixedSize: MaterialStateProperty.resolveWith(
                            (states) => const Size(100, 30)),
                        side: MaterialStateProperty.resolveWith((states) =>
                            const BorderSide(color: Colors.transparent)),
                        mouseCursor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return MouseCursor.defer;
                          }
                          return MouseCursor.uncontrolled;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: Colors.transparent)))),
                    child: Center(
                      child: Text(
                        "All",
                        style: TextStyle(
                            color: isAll ? Colors.white : Colors.grey),
                      ),
                    ),
                  ),
                  //simple
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSimple = true;
                        isModern = false;
                        isAll = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return (isSimple ? Colors.blue : Colors.white);
                          },
                        ),
                        fixedSize: MaterialStateProperty.resolveWith(
                            (states) => const Size(100, 30)),
                        side: MaterialStateProperty.resolveWith((states) =>
                            const BorderSide(color: Colors.transparent)),
                        mouseCursor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return MouseCursor.defer;
                          }
                          return MouseCursor.uncontrolled;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: Colors.transparent)))),
                    child: Center(
                      child: Text(
                        "Simple",
                        style: TextStyle(
                            color: isSimple ? Colors.white : Colors.grey),
                      ),
                    ),
                  ),
                  // modern
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isModern = true;
                        isSimple = false;
                        isAll = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return (isModern ? Colors.blue : Colors.white);
                          },
                        ),
                        fixedSize: MaterialStateProperty.resolveWith(
                            (states) => const Size(100, 30)),
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
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.white)))),
                    child: Center(
                      child: Text(
                        "Modern",
                        style: TextStyle(
                            color: isModern ? Colors.white : Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
                items: generateListCV(),
                options: CarouselOptions(
                  height: 450,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {},
                  scrollDirection: Axis.horizontal,
                )),

            ButtonWidget().buildButtonBottom(action: () {
              print("on boarding call it");
            },title: "USE",top: 35)
          ],
        ),
      ),
    );
  }

  List<Widget> generateListCV() {
    const listOfImage = ConstantVariable.listOfImage;
    List<Widget> listWidget = [];
    // listWidget = items.map((e) => Container()).toList();
    for (int i = 0; i < listOfImage.length; i++) {
      listWidget.add(Container(
          // padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                listOfImage[i],
                height: 350,
                width: double.infinity,
              ),
              Center(
                  child: Text(
                "Template #${i + 1}",
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
            ],
          )));
    }
    return listWidget;
  }
}
