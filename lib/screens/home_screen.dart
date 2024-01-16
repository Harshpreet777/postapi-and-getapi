import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:postapi/model/signup_request_model.dart';
import 'package:postapi/screens/login_screen.dart';
import 'package:postapi/services/signup_api_service.dart';
import 'package:postapi/util/input_validation.dart';

class HomeScreenClass extends StatefulWidget {
  const HomeScreenClass({super.key});

  @override
  State<HomeScreenClass> createState() => _HomeScreenClassState();
}

class _HomeScreenClassState extends State<HomeScreenClass> {
  GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool? isNameValid = true;
  bool? isEmailValid = true;
  Future<SignupModel>? futureAlbum;
  String gender = "male";
  String status = "active";
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PostApi')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    String emailPattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(emailPattern);
                    if (value.toString().isEmpty) {
                      return "Cannot be Empty";
                    } else if (!regExp.hasMatch(value!)) {
                      return "@gmail.com is required";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (!InputValidation.isEmailValid(value)) {
                      setState(() {
                        isEmailValid = false;
                      });
                    } else {
                      setState(() {
                        isEmailValid = true;
                      });
                    }
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Email Id',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    String namePattern = r'^[a-z A-Z,.\-]+$';
                    RegExp regExp = RegExp(namePattern);
                    if (value.toString().isEmpty) {
                      return "Cannot be Empty";
                    } else if (!regExp.hasMatch(value!)) {
                      return "Only Characters are allowed";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (!InputValidation.isNameValid(value)) {
                      setState(() {
                        isNameValid = false;
                      });
                    } else {
                      setState(() {
                        isNameValid = true;
                      });
                    }
                  },
                  controller: nameController,
                  decoration:
                      const InputDecoration(hintText: 'Enter Your Name'),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: RadioListTile(
                      title: const Text("Male"),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: RadioListTile(
                      title: const Text("Female"),
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: RadioListTile(
                        title: const Text('Active'),
                        value: "active",
                        groupValue: status,
                        onChanged: (value) {
                          setState(() {
                            status = value.toString();
                          });
                        }),
                  ),
                  Flexible(
                    child: RadioListTile(
                        title: const Text('Inactive'),
                        value: "inactive",
                        groupValue: status,
                        onChanged: (value) {
                          setState(() {
                            status = value.toString();
                          });
                        }),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signing In')),
                    );
                    SignupModel signupModel = SignupModel(
                        email: emailController.text,
                        name: nameController.text,
                        gender: gender,
                        status: status);
                    log("SignupModel is ${signupModel.toJson()}");
                    ApiService.postData(signupModel);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreenClass(),
                        ));
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
