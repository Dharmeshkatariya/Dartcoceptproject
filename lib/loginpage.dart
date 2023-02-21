import 'package:flutter/material.dart';

import 'loginbackprofile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red[500]),
                ),
                const SizedBox(
                  height: 30,
                ),
                _textFieldData(
                    text: "Email",
                    prefixIcon:const Icon(Icons.email_outlined),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r'\S+@\S+\.\S+')
                              .hasMatch(_emailController.text)) {
                        return 'Please Enter valid email!';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 30,
                ),
                _textFieldData(
                    text: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    controller: _passController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please  valid password!';
                      }
                      return null;
                    }),
                _containerData(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _containerData() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginBackProfile(
                        emailResult: _emailController.text,
                        passResult: _passController.text,
                      )));
        }

        // if (_emailController.text.isNotEmpty &&
        //     _passController.text.isNotEmpty && RegExp(r'\S+@\S+\.\S+').hasMatch(_emailController.text)) {
        //
        //   emailResult = _emailController.text;
        //   passResult = _passController.text;
        //
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => LoginBackProfile(
        //               emailResult: emailResult,
        //               passResult: passResult,
        //             )),
        //   );
        // }
      },
      child: Container(
        alignment: Alignment.center,
        margin:const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        padding:const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.red,
        ),
        child: const Text(
          "SUBMIT",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _textFieldData(
      {String? text,
      Widget? prefixIcon,
      TextEditingController? controller,
      required dynamic validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border:const OutlineInputBorder(),
        labelStyle:const TextStyle(fontSize: 15, color: Colors.black),
        hintStyle:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        hintText: text,
        focusColor: Colors.cyan,
      ),
    );
  }
}
