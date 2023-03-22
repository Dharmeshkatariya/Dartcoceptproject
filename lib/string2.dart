import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/controller/string_controller.dart';

class SecondString extends StatefulWidget {
  const SecondString({super.key});

  @override
  State<SecondString> createState() => _SecondStringState();
}

class _SecondStringState extends State<SecondString> {
  final _strController = Get.put(StringController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: const Text("String Function"),
      ),
      body: Obx(()=> SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textFieldData(controller: _strController.s1Controller),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Result : ${_strController.outputResult.value}",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              _containerData(
                  text: "Comma Separate",
                  onTap: () {
                    _strController.commaSeparate();
                  }),
              _containerData(
                  text: "Real Input",
                  onTap: () {
                    _strController.realInput();
                  }),
              _containerData(
                  text: "First Five Char",
                  onTap: () {
                    _strController.firstChar();
                  }),
              _containerData(
                  text: "Last Five Char",
                  onTap: () {
                    _strController.lastChar();
                  }),
              Visibility(
                  visible: _strController.isVisible.value,
                  child: _textFieldData(controller: _strController.s2Controller)),
              _containerData(
                  text: "Add 2 String",
                  onTap: () {
                    _strController.addString();
                  }),
            ],
          ),
        ),
      ),)
    );
  }

  Widget _textFieldData({TextEditingController? controller}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(fontSize: 15, color: Colors.black),
        hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        hintText: "Enter Name",
        focusColor: Colors.cyan,
      ),
    );
  }

  Widget _containerData({required String text, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red[500],
          borderRadius: BorderRadius.circular(25),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
