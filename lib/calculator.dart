import 'package:flutter/material.dart';
import 'package:revisionproject/common.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String outputResult = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(12),
              color: Colors.blueGrey,
              child: Text(
                outputResult,
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
    );
  }

  _numberPress(String num) {
    outputResult += num;
    setState(() {});
  }

  _clearPress() {
    if (outputResult.isNotEmpty) {
      outputResult = outputResult.substring(0, outputResult.length - 1);
    }
    setState(() {});
  }

  bool _isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  _separate() {
    String num1 = "";
    String num2 = "";
    String opp = "";

    bool isNumber = true;
    for (int i = 0; i < outputResult.length; i++) {
      if (_isNumeric(outputResult[i])) {
        if (isNumber) {
          num1 += outputResult[i];
        } else {
          num2 += outputResult[i];
        }
      } else {
        isNumber = false;
        opp += outputResult[i];
      }
    }
    outputResult = Common.operation(num1, num2, opp);
    setState(() {});
  }

  Widget _row0() {
    return Row(
      children: [
        _containerData(
            text: "0",
            onTap: () {
              _numberPress('0');
              _separate();
            }),
        _containerData(
            text: ".",
            onTap: () {
              _numberPress(".");
            }),
        _containerData(
            text: "=",
            color: Colors.teal,
            onTap: () {
              _separate();
            }),
        _containerData(
            text: "+",
            color: Colors.orange.shade400,
            onTap: () {
              _numberPress("+");
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
              _numberPress("1");
            }),
        _containerData(
            text: "2",
            onTap: () {
              _numberPress("2");
            }),
        _containerData(
            text: "3",
            onTap: () {
              _numberPress("3");
            }),
        _containerData(
            text: "-",
            color: Colors.orange.shade400,
            onTap: () {
              _numberPress("-");
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
              _numberPress("4");
            }),
        _containerData(
            text: "5",
            onTap: () {
              _numberPress("5");
            }),
        _containerData(
            text: "6",
            onTap: () {
              _numberPress("6");
            }),
        _containerData(
            text: "*",
            color: Colors.orange.shade400,
            onTap: () {
              _numberPress("*");
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
              _numberPress("7");
            }),
        _containerData(
            text: "8",
            onTap: () {
              _numberPress("8");
            }),
        _containerData(
            text: "9",
            onTap: () {
              _numberPress("9");
            }),
        _containerData(
            text: "/",
            color: Colors.orange.shade400,
            onTap: () {
              _numberPress("/");
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
              outputResult = "0";
              setState(() {});
            }),
        _containerData(
            text: "C",
            color: Colors.orange.shade400,
            onTap: () {
              _clearPress();
            }),
        _containerData(
            text: "%",
            onTap: () {
              _numberPress("%");
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
