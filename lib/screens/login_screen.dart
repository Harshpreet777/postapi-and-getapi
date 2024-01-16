import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:postapi/model/login_response_model.dart';
import 'package:postapi/services/login_api_service.dart';

class LoginScreenClass extends StatefulWidget {
  const LoginScreenClass({super.key});

  @override
  State<LoginScreenClass> createState() => _LoginScreenClassState();
}

class _LoginScreenClassState extends State<LoginScreenClass> {
  TextEditingController emailController1 = TextEditingController();
  TextEditingController nameController1 = TextEditingController();
  String gender = "male";
  late Future<List<LoginModel>> requestLogin;

  @override
  void initState() {
    super.initState();
    requestLogin = LoginApiService.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: nameController1,
              decoration: const InputDecoration(hintText: 'Enter Your Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: emailController1,
              decoration: const InputDecoration(hintText: 'Enter Your Mail'),
            ),
          ),
          const Align(alignment: Alignment.center, child: Text('Your Gender')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RadioListTile(
                  title: const Text("Male"),
                  value: 'male',
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
                  title: const Text('Female'),
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
          ElevatedButton(
              onPressed: () {
                if (nameController1.text == requestLogin.toString()) {
                  setState(() {
                    log('Logged In');
                  });
                }
              },
              child: const Text("Login")),
          FutureBuilder<List<LoginModel>>(
            
            future: requestLogin,
            builder: (context, snapshot) {
              List<LoginModel> getLoginData = snapshot.data ?? [];
              return ListView.builder(
                shrinkWrap: true,
                itemCount: getLoginData.length,
                itemBuilder: (context, index) {
                  LoginModel login = getLoginData[index];
                  return Text(login.name);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
