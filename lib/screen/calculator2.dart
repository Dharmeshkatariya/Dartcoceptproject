import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/controller/calculator_controller.dart';

class CalculatorApp extends GetView<CalculatorController>{
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              color: Colors.blueGrey,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                controller.outputResult.value,
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellowAccent),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        _containerData(
                            text: "Ac",
                            color: Colors.red,
                            onTap: () {
                              controller.outputResult.value = "0";
                            }),
                        _containerData(
                            text: "C",
                            color: Colors.blue.shade300,
                            onTap: () {
                              controller.clearPress();
                            }),
                        _containerData(
                            text: "%",
                            onTap: () {
                              controller.numberPress("%");
                            }),
                        _containerData(
                            text: "",
                            color: controller.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!controller.isDisable.value) {
                                controller.isDisable.value = true;
                                controller.numberPress("");
                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "7",
                            onTap: () {
                              controller.numberPress("7");
                            }),
                        _containerData(
                            text: "8",
                            onTap: () {
                              controller.numberPress("8");
                            }),
                        _containerData(
                            text: "9",
                            onTap: () {
                              controller.numberPress("9");
                            }),
                        _containerData(
                            text: "/",
                            color: controller.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!controller.isDisable.value) {
                                controller.isDisable.value = true;
                                controller.numberPress("/");
                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "4",
                            onTap: () {
                              controller.numberPress("4");
                            }),
                        _containerData(
                            text: "5",
                            onTap: () {
                              controller.numberPress("5");
                            }),
                        _containerData(
                            text: "6",
                            onTap: () {
                              controller.numberPress("6");
                            }),
                        _containerData(
                            text: "X",
                            color: controller.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!controller.isDisable.value) {
                                controller.isDisable.value = true;
                                controller.numberPress("*");
                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "1",
                            onTap: () {
                              controller.numberPress("1");
                            }),
                        _containerData(
                            text: "2",
                            onTap: () {
                              controller.numberPress("2");
                            }),
                        _containerData(
                            text: "3",
                            onTap: () {
                              controller.numberPress("3");
                            }),
                        _containerData(
                            text: "-",
                            color: controller.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!controller.isDisable.value) {
                                controller.isDisable.value = true;
                                controller.numberPress("-");
                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "0",
                            onTap: () {
                              controller.numberPress("0");
                            }),
                        _containerData(
                            text: ".",
                            onTap: () {
                              controller.numberPress(".");
                            }),
                        _containerData(
                            text: "=",
                            color: Colors.cyanAccent,
                            onTap: () {
                              controller.isDisable.value = false;
                              controller.separate();
                            }),
                        _containerData(
                            text: "+",
                            color: controller.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!controller.isDisable.value) {
                                controller.isDisable.value = true;
                                controller.numberPress("+");
                              }
                            }),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    ));
  }

  Widget _containerData(
      {required String text, Color? color, GestureTapCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? Colors.white,
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
