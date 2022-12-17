import 'package:cv_1/common/const_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestModel {
  String name;
  String job;
  String date;
  TestModel({required this.name, required this.job, required this.date});
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late List<TestModel> list = [
    TestModel(name: "", job: "", date: ""),
    TestModel(name: "", job: "", date: ""),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          // height: 500,
            color: Colors.grey.shade500,
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              children: [
                Container(
                  height: 600,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: ((context, index) {
                    return Container(
                      height: 144,
                      width: width,
                      margin: EdgeInsets.all(20),
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(children: [
                        //name
                        SizedBox(
                          width: 0.8 * width,
                          // height: 40,
                          child: TextFormField(
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
                                        'Full name $index',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // job
                        SizedBox(
                          width: 0.8 * width,
                          // height: 40,
                          child: TextFormField(
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
                                        'Job Title $index',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //date
                        SizedBox(
                          width: 0.8 * width,
                          // height: 40,
                          child: TextFormField(
                            // controller: ,
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
                                        'Date of birth $index',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    );
                  })),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    list.add(TestModel(name: "sdfs", job: "sdfs", date: "date"));
                  });
                }, child: Text("click"))
              ],
            )
            ));
  }
}

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("jshdfs"),
    );
  }
}