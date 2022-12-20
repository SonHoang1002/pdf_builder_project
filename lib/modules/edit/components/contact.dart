import 'dart:io';

import 'package:cv_1/common/const_var.dart';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late ContactModel contact = ContactModel(
      phone: TextEditingController(text: "12312"),
      email: TextEditingController(text: "sdfs@gmail.com"),
      address: TextEditingController(text: "sdfs"));

  late final fullTitle = ["Phone Number", "Email Address", "Your Address"];
  late final shortTitle = ["Phone", "Email", "Address"];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                          controller: contact.phone,
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
                                      contact.phone.text.trim().length > 0
                                          ? shortTitle[0]
                                          : fullTitle[0],
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
                          controller: contact.email,
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
                                      contact.email.text.trim().length > 0
                                          ? shortTitle[1]
                                          : fullTitle[1],
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
                    controller: contact.address,
                    style: TextStyle(fontWeight: FontWeight.bold),
                   
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        width: 100,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                              child: Text(
                                contact.address.text.trim().length > 0
                                    ? shortTitle[2]
                                    : fullTitle[2],
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
}
