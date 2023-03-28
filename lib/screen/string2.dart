import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/controller/string_controller.dart';

class SecondString extends GetView<StringController> {
  const SecondString({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: const Text("String Function"),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textFieldData(controller: controller.s1Controller),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Result : ${controller.outputResult.value}",
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
                        controller.commaSeparate();
                      }),
                  _containerData(
                      text: "Real Input",
                      onTap: () {
                        controller.realInput();
                      }),
                  _containerData(
                      text: "First Five Char",
                      onTap: () {
                        controller.firstChar();
                      }),
                  _containerData(
                      text: "Last Five Char",
                      onTap: () {
                        controller.lastChar();
                      }),
                  Visibility(
                      visible: controller.isVisible.value,
                      child:
                          _textFieldData(controller: controller.s2Controller)),
                  _containerData(
                      text: "Add 2 String",
                      onTap: () {
                        controller.addString();
                      }),
                ],
              ),
            ),
          ),
        ));
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
