import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16.0),
            controller: _controller,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: width,
                  child: Text(
                    'Hello 1',
                  ),
                ),
                onTap: () async{
                  await _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
              ),
              GestureDetector(
                child: Container(
                  width: width,
                  child: Text(
                    'Hello 2',
                  ),
                ),
                onTap: () async{
                  await _controller.animateTo(0.5*width + 24, duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
              ),
              GestureDetector(
                child: Container(
                  width: width,
                  child: Text(
                    'Hello 3',
                  ),
                ),
                onTap: () async{
                  await _controller.animateTo(1.5*width + 24, duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
              ),
              GestureDetector(
                child: Container(
                  width: width,
                  child: Text(
                    'Hello 4',
                  ),
                ),
                onTap: () async{
                  await _controller.animateTo(2.5*width + 24, duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
              ),
              GestureDetector(
                child: Container(
                  width: width,
                  child: Text(
                    'Hello 5',
                  ),
                ),
                onTap: () async{
                  await _controller.animateTo(3.5*width + 24, duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
              ),
              GestureDetector(
                child: Container(
                  width: width,
                  child: Text(
                    'Hello 6',
                  ),
                ),
                onTap: () async{
                  await _controller.animateTo(4.5*width + 24, duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
              ),
            ],
          )));
      
    
  }
}
