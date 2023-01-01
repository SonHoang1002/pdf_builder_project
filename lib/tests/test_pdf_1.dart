import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';



late final fullContactTitle = ["Phone Number", "Email Address", "Your Address"];
late final shortContactTitle = ["Phone", "Email", "Address"];

class TestInput extends StatefulWidget {
  const TestInput({super.key});

  @override
  State<TestInput> createState() => _TestInputState();
}


late TextEditingController controller = TextEditingController(text: "");

class _TestInputState extends State<TestInput> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (controller.text.trim().length <= 0) {
      context.read<PhoneBloc>().add(UpdatePhoneEvent("Phone Number"));
    } else {
      context.read<PhoneBloc>().add(UpdatePhoneEvent("Phone"));
    }
    return Scaffold(
      body: BlocBuilder<PhoneBloc, PhoneState>(builder: (context, state) {
        return Container(
          color: Colors.red,
          child: Center(
            child: GestureDetector(
              // onTap: (() {
              //   if (controller.text.trim().length <= 0) {
              //     context
              //         .read<PhoneBloc>()
              //         .add(UpdatePhoneEvent("Phone Number"));
              //   } else {
              //     context.read<PhoneBloc>().add(UpdatePhoneEvent("Phone"));
              //   }
              // }),
              child: SizedBox(
                width: 0.8 * width,
                // height: 40,
                child: TextFormField(
                  controller: controller,
                  onChanged: ((value) {
                    if (controller.text.trim().length <= 0) {
                      context
                          .read<PhoneBloc>()
                          .add(UpdatePhoneEvent("Phone Number"));
                    } else {
                      context.read<PhoneBloc>().add(UpdatePhoneEvent("Phone"));
                    }
                  }),
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly,
                  // ],
                  // keyboardType: TextInputType.number,
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
                              // contact.phone.text.trim().length > 0
                              //     ? shortTitle[0]
                              //     : fullTitle[0],
                              context.read<PhoneBloc>().state.phone,
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

abstract class PhoneState {
  final String phone;
  PhoneState(this.phone);
}

class InitPhone extends PhoneState {
  InitPhone() : super("Phone Number");
}

class SetPhone extends PhoneState {
  final String phone;
  SetPhone(this.phone) : super(phone);
}

abstract class PhoneEvent {}

class UpdatePhoneEvent extends PhoneEvent {
  final String phone;
  UpdatePhoneEvent(this.phone);
}

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  PhoneBloc() : super(InitPhone()) {
    on<UpdatePhoneEvent>((event, emit) {
      emit(SetPhone(event.phone));
    });
  }
}
