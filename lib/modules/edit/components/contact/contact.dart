import 'dart:io';
import 'package:cv_1/common/format_input.dart';
import 'package:cv_1/models/contact_model.dart';
import 'package:cv_1/modules/edit/components/all_view.dart';
import 'package:cv_1/modules/edit/components/contact/blocs/contact_bloc.dart';
import 'package:cv_1/modules/edit/components/contact/blocs/contact_event.dart';
import 'package:cv_1/modules/edit/components/contact/blocs/contact_state.dart';
import 'package:cv_1/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late final fullContactTitle = ["Phone Number", "Email Address", "Your Address"];
late final shortContactTitle = ["Phone", "Email", "Address"];

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // late String phoneTitle = fullTitle[0];
    return BlocBuilder<ContactBloc, ContactState>(
        bloc: ContactBloc(),
        builder: ((context, state) {
          late ContactModel contact =
              BlocProvider.of<ContactBloc>(context).state.contactModel;
          ContactRepo().setContactRepo(contact);

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
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            //phone
                            SizedBox(
                              width: 0.8 * width,
                              // height: 40,
                              child:
                                  BlocBuilder<ContactPhoneTitleCubit, String>(
                                      builder: ((context, state) {
                                return TextFormField(
                                  controller: contact.phone,
                                  onChanged: ((value) {
                                    context
                                        .read<ContactBloc>()
                                        .add(UpdateContactEvent(contact));
                                    ContactRepo().setContactRepo(contact);
                                    if (contact.phone.text.trim().length <= 0) {
                                      context
                                          .read<ContactPhoneTitleCubit>()
                                          .updateContactPhoneEvent(
                                              fullContactTitle[0]);
                                    } else {
                                      context
                                          .read<ContactPhoneTitleCubit>()
                                          .updateContactPhoneEvent(
                                              shortContactTitle[0]);
                                    }
                                  }),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    CustomInputFormatter()
                                  ],
                                  keyboardType: TextInputType.number,
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
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Text(
                                              // contact.phone.text.trim().length > 0
                                              //     ? shortTitle[0]
                                              //     : fullTitle[0],
                                              context
                                                  .read<
                                                      ContactPhoneTitleCubit>()
                                                  .state,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                            ),
                            // email
                            SizedBox(
                                width: 0.8 * width,
                                // height: 40,
                                child:
                                    BlocBuilder<ContactEmailTitleCubit, String>(
                                  builder: (context, state) {
                                    return TextFormField(
                                      controller: contact.email,
                                      onChanged: ((value) {
                                        context
                                            .read<ContactBloc>()
                                            .add(UpdateContactEvent(contact));
                                        ContactRepo().setContactRepo(contact);
                                        if (contact.email.text.trim().length <=
                                            0) {
                                          context
                                              .read<ContactEmailTitleCubit>()
                                              .updateContactEmailEvent(
                                                  fullContactTitle[1]);
                                        } else {
                                          context
                                              .read<ContactEmailTitleCubit>()
                                              .updateContactEmailEvent(
                                                  shortContactTitle[1]);
                                        }
                                      }),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 5, 0),
                                                child: Text(
                                                  context
                                                      .watch<
                                                          ContactEmailTitleCubit>()
                                                      .state,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )),
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
                          child: BlocBuilder<ContactAddressTitleCubit, String>(
                            builder: (context, state) {
                              return TextFormField(
                                controller: contact.address,
                                onChanged: ((value) {
                                  context
                                      .read<ContactBloc>()
                                      .add(UpdateContactEvent(contact));
                                  ContactRepo().setContactRepo(contact);
                                  if (contact.address.text.trim().length <= 0) {
                                    context
                                        .read<ContactAddressTitleCubit>()
                                        .updateContactAddressEvent(
                                            fullContactTitle[2]);
                                  } else {
                                    context
                                        .read<ContactAddressTitleCubit>()
                                        .updateContactAddressEvent(
                                            shortContactTitle[2]);
                                  }
                                }),
                                style: TextStyle(fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  prefixIcon: Container(
                                    width: 104,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 0, 5, 0),
                                          child: Text(
                                            context
                                                .watch<
                                                    ContactAddressTitleCubit>()
                                                .state,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(12),
                                ),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

// set change for title date of birth while enter keyboard
class ContactPhoneTitleCubit extends Cubit<String> {
  ContactPhoneTitleCubit() : super(fullContactTitle[0]);
  void updateContactPhoneEvent(String value) => emit(value);
}

class ContactEmailTitleCubit extends Cubit<String> {
  ContactEmailTitleCubit() : super(fullContactTitle[1]);
  void updateContactEmailEvent(String value) => emit(value);
}

class ContactAddressTitleCubit extends Cubit<String> {
  ContactAddressTitleCubit() : super(fullContactTitle[2]);
  void updateContactAddressEvent(String value) => emit(value);
}
