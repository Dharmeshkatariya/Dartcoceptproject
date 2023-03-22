import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/controller/calculator_controller.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final _calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              color: Colors.blueGrey,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                _calculatorController.outputResult.value,
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
                              _calculatorController.outputResult.value = "0";
                              setState(() {});
                            }),
                        _containerData(
                            text: "C",
                            color: Colors.blue.shade300,
                            onTap: () {
                              _calculatorController.clearPress();
                            }),
                        _containerData(
                            text: "%",
                            onTap: () {
                              _calculatorController.numberPress("%");
                            }),
                        _containerData(
                            text: "",
                            color: _calculatorController.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!_calculatorController.isDisable.value) {
                                _calculatorController.isDisable.value = true;
                                _calculatorController.numberPress("");
                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "7",
                            onTap: () {
                              _calculatorController.numberPress("7");
                            }),
                        _containerData(
                            text: "8",
                            onTap: () {
                              _calculatorController.numberPress("8");
                            }),
                        _containerData(
                            text: "9",
                            onTap: () {
                              _calculatorController.numberPress("9");
                            }),
                        _containerData(
                            text: "/",
                            color: _calculatorController.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!_calculatorController.isDisable.value) {
                                _calculatorController.isDisable.value = true;
                                _calculatorController.numberPress("/");
                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "4",
                            onTap: () {
                              _calculatorController.numberPress("4");
                            }),
                        _containerData(
                            text: "5",
                            onTap: () {
                              _calculatorController.numberPress("5");
                            }),
                        _containerData(
                            text: "6",
                            onTap: () {
                              _calculatorController.numberPress("6");
                            }),
                        _containerData(
                            text: "X",
                            color: _calculatorController.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!_calculatorController.isDisable.value) {
                                _calculatorController.isDisable.value = true;
                                _calculatorController.numberPress("*");
                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "1",
                            onTap: () {
                              _calculatorController.numberPress("1");
                            }),
                        _containerData(
                            text: "2",
                            onTap: () {
                              _calculatorController.numberPress("2");
                            }),
                        _containerData(
                            text: "3",
                            onTap: () {
                              _calculatorController.numberPress("3");
                            }),
                        _containerData(
                            text: "-",
                            color: _calculatorController.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!_calculatorController.isDisable.value) {
                                _calculatorController.isDisable.value = true;
                                _calculatorController.numberPress("-");
                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "0",
                            onTap: () {
                              _calculatorController.numberPress("0");
                            }),
                        _containerData(
                            text: ".",
                            onTap: () {
                              _calculatorController.numberPress(".");
                            }),
                        _containerData(
                            text: "=",
                            color: Colors.cyanAccent,
                            onTap: () {
                              _calculatorController.isDisable.value = false;
                              _calculatorController.separate();
                            }),
                        _containerData(
                            text: "+",
                            color: _calculatorController.isDisable.value
                                ? Colors.blueGrey
                                : Colors.orange.shade400,
                            onTap: () {
                              if (!_calculatorController.isDisable.value) {
                                _calculatorController.isDisable.value = true;
                                _calculatorController.numberPress("+");
                              }
                            }),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
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
