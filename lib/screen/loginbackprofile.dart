import 'package:flutter/material.dart';

class LoginBackProfile extends StatefulWidget {
  const LoginBackProfile(
      {super.key, required this.emailResult, required this.passResult});

  final String emailResult;
  final String passResult;

  @override
  State<LoginBackProfile> createState() => _LoginBackProfileState();
}

class _LoginBackProfileState extends State<LoginBackProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("ProfileDetail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding:const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email id :- ${widget.emailResult}",
                style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
              Text(
                "Password :- ${widget.passResult}",
                style:const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
