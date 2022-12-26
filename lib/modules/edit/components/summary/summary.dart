import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/models/summary_model.dart';
import 'package:cv_1/modules/edit/components/summary/blocs/summary_bloc.dart';
import 'package:cv_1/modules/edit/components/summary/blocs/summary_event.dart';
import 'package:cv_1/modules/edit/components/summary/blocs/summary_state.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

const List<String> titles = ["SUMMARY", "EXAMPLE"];

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<SummaryBloc, SummaryState>(builder: ((context, state) {
      final SummaryModel _summaryModel =
          BlocProvider.of<SummaryBloc>(context).state.modelSummary;
      SummaryRepo().setSummaryRepo(_summaryModel);
      return Container(
        height: 515,
        child: Column(
          children: [
            // summary title
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  titles[0],
                  style: TextStyle(color: Colors.grey[700], fontSize: 17),
                )
              ],
            ),
            //summary input tag
            Container(
              height: 200,
              width: width,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              // color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 0.83 * width,
                      // height: 45,
                      child: TextFormField(
                        controller: _summaryModel.summaryController,
                        minLines: 10,
                        maxLines: 10,
                        expands: false,
                        onChanged: (value) {
                          context
                              .read<SummaryBloc>()
                              .add(UpdateSummaryEvent(_summaryModel));
                          SummaryRepo().setSummaryRepo(_summaryModel);
                        },
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Your Summary Statement',
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 15),
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                      ),
                    ),
                  ]),
            ),
            // example title
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  titles[1],
                  style: TextStyle(color: Colors.grey[700], fontSize: 17),
                )
              ],
            ),

            Container(
              height: 220,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    height: 215,
                    width: 240,
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: ConstantVariable.colorOfExamples[index]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(
                                    text: ConstantVariable
                                        .examplesForSummary[index]))
                                .then((_) => ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content:
                                            Text("Copied to your clipboard"))));
                            print("copy ok");
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                height: 25,
                                width: 25,
                                child: Image.asset(
                                    ConstantVariable.pathImg + "copy.png"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: 225,
                            child: Text(
                              ConstantVariable.examplesForSummary[index],
                              textAlign: TextAlign.justify,
                            ))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    }));
  }
}
