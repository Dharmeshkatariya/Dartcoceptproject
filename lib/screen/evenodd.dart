import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/controller/evenodd_controller.dart';

class EvenOddProfile extends StatelessWidget {
  EvenOddProfile({super.key});

  final _evenOddController = Get.put(EvenOddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text(
            "Even/Odd",
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      _textfielddata(
                          controller: _evenOddController.num1Controller),
                      const SizedBox(
                        width: 15,
                      ),
                      _textfielddata(
                          controller: _evenOddController.num2Controller),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _containerData(
                      text: "Even",
                      onTab: () {
                        _evenOddController.evenCheck(
                            _evenOddController.num1Controller,
                            _evenOddController.num2Controller);
                      }),
                  _containerData(
                      text: "Odd",
                      onTab: () {
                        _evenOddController.oddCheck(
                            _evenOddController.num1Controller,
                            _evenOddController.num2Controller);
                      }),
                  Text(
                    "RESULT : ${_evenOddController.outputResult.value}",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _textfielddata({required TextEditingController controller}) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
          hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          labelText: "Enter Num",
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
          hintText: "Num",
          focusColor: Colors.cyan,
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
