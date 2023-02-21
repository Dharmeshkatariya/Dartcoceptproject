import 'package:flutter/material.dart';
import 'package:revisionproject/common.dart';

class StudentResult extends StatefulWidget {
  const StudentResult({super.key});

  @override
  State<StudentResult> createState() => _StudentResultState();
}

class _StudentResultState extends State<StudentResult> {
  final _mathController = TextEditingController();
  final _chemController = TextEditingController();
  final _phyController = TextEditingController();

  double avr = 0.0;
  String grade = "";
  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/icon/cityschool.jpg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                      child: _text(
                          text: "City Model School", color: Colors.red[900])),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              _text(text: "Student Name : Dharmesh "),
              const  SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _text(text: "Class -A"),
                  _text(text: "Standard - 12"),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _text(text: "Subject"),
                  _text(text: "Total"),
                  _text(text: "Achievement"),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        _text(text: "Mathematics"),
                        const  SizedBox(
                          height: 35,
                        ),
                        _text(text: "Chemistry"),
                        const  SizedBox(
                          height: 35,
                        ),
                        _text(text: "physics"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _text(text: "100"),
                        const SizedBox(
                          height: 35,
                        ),
                        _text(text: "100"),
                        const SizedBox(
                          height: 35,
                        ),
                        _text(text: "100"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        _textFieldData(controller: _mathController),
                        _textFieldData(controller: _chemController),
                        _textFieldData(controller: _phyController),
                      ],
                    ),
                  )
                ],
              ),
              _text(
                  text: "Result :- ${isPass ? 'pass' : 'fail'}",
                  color: isPass ? Colors.blueAccent : Colors.red),
              const SizedBox(
                height: 25,
              ),
              _text(text: "Grade :- $grade"),
              const SizedBox(
                height: 25,
              ),
              _text(text: "Perchantage :- $avr%"),
              const SizedBox(
                height: 25,
              ),
              _text(
                  text: isPass ? 'congratulation' : 'sorry',
                  color: isPass ? Colors.blueAccent : Colors.red),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  avr = Common.average(
                      double.parse(_mathController.text),
                      double.parse(_chemController.text),
                      double.parse(_phyController.text));
                  isPass = Common.passing(
                      int.parse(_mathController.text),
                      int.parse(_chemController.text),
                      int.parse(_phyController.text));
                  grade = Common.grading(avr);

                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: _text(text: "SUBMIT", color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldData({TextEditingController? controller}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
        hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        hintText: "Marks",
        focusColor: Colors.cyan,
      ),
    );
  }

  Widget _text({required String text, Color? color}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: color ?? Colors.black),
    );
  }
}
