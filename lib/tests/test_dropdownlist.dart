import 'package:cv_1/common/const_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestDropDownList extends StatefulWidget {
  @override
  State<TestDropDownList> creaTestDropDownListate() => _TestDropDownListState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _TestDropDownListState extends State<TestDropDownList> {
  // final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.grey.shade500,
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Container(
            height: 144,
            width: width,
            margin: EdgeInsets.all(20),
            // color: Colors.red,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  child: SizedBox(
                    width: 0.8 * width,
                    height: 43,
                    child: TextFormField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 9, 0, 0),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Container(
                          width: 148,
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                  "Ggfg",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
              onChanged: (_) {},
            )),
      ),
    );
  }
}
