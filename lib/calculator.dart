import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/common.dart';
import 'package:revisionproject/controller/calculator_controller.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _calController = Get.put(CalculatorController());

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
                _calController.outputResult.value,
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
              _calController.numberPress("0");
              _calController.separate();
            }),
        _containerData(
            text: ".",
            onTap: () {
              _calController.numberPress(".");
            }),
        _containerData(
            text: "=",
            color: Colors.teal,
            onTap: () {
              _calController.separate();
            }),
        _containerData(
            text: "+",
            color: Colors.orange.shade400,
            onTap: () {
              _calController.numberPress("+");
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
              _calController.numberPress("1");
            }),
        _containerData(
            text: "2",
            onTap: () {
              _calController.numberPress("2");
            }),
        _containerData(
            text: "3",
            onTap: () {
              _calController.numberPress("3");
            }),
        _containerData(
            text: "-",
            color: Colors.orange.shade400,
            onTap: () {
              _calController.numberPress("-");
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
              _calController.numberPress("4");
            }),
        _containerData(
            text: "5",
            onTap: () {
              _calController.numberPress("5");
            }),
        _containerData(
            text: "6",
            onTap: () {
              _calController.numberPress("6");
            }),
        _containerData(
            text: "*",
            color: Colors.orange.shade400,
            onTap: () {
              _calController.numberPress("*");
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
              _calController.numberPress("7");
            }),
        _containerData(
            text: "8",
            onTap: () {
              _calController.numberPress("8");
            }),
        _containerData(
            text: "9",
            onTap: () {
              _calController.numberPress("9");
            }),
        _containerData(
            text: "/",
            color: Colors.orange.shade400,
            onTap: () {
              _calController.numberPress("/");
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
              _calController.outputResult.value = "0";
            }),
        _containerData(
            text: "C",
            color: Colors.orange.shade400,
            onTap: () {
              _calController.clearPress();
            }),
        _containerData(
            text: "%",
            onTap: () {
              _calController.numberPress("%");
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
