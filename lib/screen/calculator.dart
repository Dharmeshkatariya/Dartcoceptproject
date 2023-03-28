import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/controller/calculator_controller.dart';

class CalculatorPage extends GetView<CalculatorController> {
  const  CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(12),
              color: Colors.blueGrey,
              child: Text(
                controller.outputResult.value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _rowAc(),
                  _row7(),
                  _row4(),
                  _row1(),
                  _row0(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _row0() {
    return Row(
      children: [
        _containerData(
            text: "0",
            onTap: () {
              controller.numberPress("0");
              controller.separate();
            }),
        _containerData(
            text: ".",
            onTap: () {
              controller.numberPress(".");
            }),
        _containerData(
            text: "=",
            color: Colors.teal,
            onTap: () {
              controller.separate();
            }),
        _containerData(
            text: "+",
            color: Colors.orange.shade400,
            onTap: () {
              controller.numberPress("+");
            }),
      ],
    );
  }

  Widget _row1() {
    return Row(
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
            color: Colors.orange.shade400,
            onTap: () {
              controller.numberPress("-");
            }),
      ],
    );
  }

  Widget _row4() {
    return Row(
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
            text: "*",
            color: Colors.orange.shade400,
            onTap: () {
              controller.numberPress("*");
            }),
      ],
    );
  }

  Widget _row7() {
    return Row(
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
            color: Colors.orange.shade400,
            onTap: () {
              controller.numberPress("/");
            }),
      ],
    );
  }

  Widget _rowAc() {
    return Row(
      children: [
        _containerData(
            text: "Ac",
            color: Colors.red,
            onTap: () {
              controller.outputResult.value = "0";
            }),
        _containerData(
            text: "C",
            color: Colors.orange.shade400,
            onTap: () {
              controller.clearPress();
            }),
        _containerData(
            text: "%",
            onTap: () {
              controller.numberPress("%");
            }),
        _containerData(text: "", color: Colors.orange.shade400),
      ],
    );
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
