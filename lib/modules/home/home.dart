import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Container(
                margin: EdgeInsets.only(left: 35), child: Text("Home"))),
        actions: [
          Row(children: [
            Image.asset(
              "${ConstantVariable.pathImg}setting.png",
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 10,
            )
          ])
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                // color: Colors.black,
                child: Container(
              height: 525,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: ConstantVariable.listOfImage
                    .map((e) => SizedBox(
                        width: 350,
                        height: 500,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.asset(
                              e,
                            ))))
                    .toList(),
              ),
            )),
            ButtonWidget().buildButtonBottom(
                action: () {
                  print("home call it");
                },
                title: "CREATE RESUME",
                top:35),
            const SizedBox(
              height: 42,
            )
          ],
        ),
      ),
    );
  }
}
