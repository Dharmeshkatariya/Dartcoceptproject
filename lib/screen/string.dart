import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/controller/string_controller.dart';

class StrScreenPage extends GetView<StringController> {
  StrScreenPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text(
            "String Function",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              child: Column(
                children: [
                  _textField(controller: controller.s1Controller),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Result : ${controller.outputResult}",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  _containerData(
                      text: "Comma Separate",
                      onTab: () {
                        controller.commaSeparate();
                      }),
                  _containerData(
                      text: "Real Input",
                      onTab: () {
                        controller.realInput();
                      }),
                  _containerData(
                      text: "First Five Char",
                      onTab: () {
                        controller.firstChar();
                      }),
                  _containerData(
                      text: "Last Five Char",
                      onTab: () {
                        controller.lastChar();
                      }),
                  Visibility(
                      visible: controller.isVisible.value,
                      child: _textField(
                          controller: controller.s2Controller)),
                  _containerData(
                      text: "Add 2 String",
                      onTab: () {
                        controller.addString();
                      }),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _textField({required TextEditingController controller}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
        hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        labelText: "Enter name",
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        hintText: "Name",
        focusColor: Colors.cyan,
      ),
    );
  }

  Widget _containerData({required String text, GestureTapCallback? onTab}) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red[500],
          borderRadius: BorderRadius.circular(25),
        ),
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.s1Controller.dispose();
    controller.s2Controller.dispose();
  }
}
