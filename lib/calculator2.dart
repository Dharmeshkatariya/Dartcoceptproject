import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String outputResult = "0";
  bool isDisable = false;

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
                outputResult,
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
                              outputResult = "0";
                              setState(() {});
                            }),
                        _containerData(
                            text: "C",

                            color:  Colors.blue.shade300,
                            onTap: () {
                              _clearPress();
                            }),
                        _containerData(
                            text: "%",
                            onTap: () {
                              _numPress("%");
                            }),
                        _containerData(
                            text: "",
                            color: isDisable? Colors.blueGrey: Colors.orange.shade400,
                            onTap: () {
                              if(!isDisable){
                                isDisable=true;
                                _numPress("");

                              }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "7",
                            onTap: () {
                              _numPress("7");
                            }),
                        _containerData(
                            text: "8",
                            onTap: () {
                              _numPress("8");
                            }),
                        _containerData(
                            text: "9",
                            onTap: () {
                              _numPress("9");
                            }),
                        _containerData(
                            text: "/",
                            color: isDisable? Colors.blueGrey: Colors.orange.shade400,
                            onTap: ()  {
                             if(!isDisable){
                               isDisable =true;
                               _numPress("/");
                             }
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "4",
                            onTap: () {
                              _numPress("4");
                            }),
                        _containerData(
                            text: "5",
                            onTap: () {
                              _numPress("5");
                            }),
                        _containerData(
                            text: "6",
                            onTap: () {
                              _numPress("6");
                            }),
                        _containerData(
                            text: "X",
                            color: isDisable? Colors.blueGrey: Colors.orange.shade400,
                            onTap: () {
                              if(!isDisable){
                                isDisable=true;
                                _numPress("*");
                              }

                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "1",
                            onTap: () {
                              _numPress("1");
                            }),
                        _containerData(
                            text: "2",
                            onTap: () {
                              _numPress("2");
                            }),
                        _containerData(
                            text: "3",
                            onTap: () {
                              _numPress("3");
                            }),
                        _containerData(
                            text: "-",
                            color: isDisable? Colors.blueGrey: Colors.orange.shade400,
                            onTap: () {
                              if(!isDisable) {
                                isDisable = true;
                                _numPress("-");
                              }

                            }),
                      ],
                    ),
                    Row(
                      children: [
                        _containerData(
                            text: "0",
                            onTap: () {
                              _numPress("0");
                            }),
                        _containerData(
                            text: ".",
                            onTap: () {
                              _numPress(".");
                            }),
                        _containerData(
                            text: "=",
                            color: Colors.cyanAccent,
                            onTap: () {
                              isDisable = false;
                            _separate();
                            }),
                        _containerData(
                            text: "+",
                            color: isDisable? Colors.blueGrey: Colors.orange.shade400,
                            onTap: () {
                              if(!isDisable){
                                isDisable=true;
                                _numPress("+");
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

  _clearPress() {
    if (outputResult.length > 0 && outputResult.isNotEmpty)
      outputResult = outputResult.substring(0, outputResult.length - 1);
    setState(() {});
  }

  _numPress(String num) {
    outputResult += num;
    setState(() {});
  }

  bool isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  _separate() {
    String num1 = "";
    String num2 = "";
    String opp = "";
    bool isNum = true;

    for (int i = 0; i < outputResult.length; i++) {
      if (isNumeric(outputResult[i])) {
        if (isNum) {
          num1 += outputResult[i];
        } else {
          num2 += outputResult[i];
        }
      } else {
        isNum = false;
        opp += outputResult[i];
      }
    }
    if(num1.isNotEmpty && num2.isNotEmpty){
      _operation(num1, num2, opp);
    }

  }

  _operation(String num1,String num2,String opp){

    if( opp == "+"){
      outputResult = (int.parse(num1) + int.parse(num2)).toString();
    }else if(opp == "-"){
      outputResult = (int.parse(num1) - int.parse(num2)).toString();
    }else if(opp == "*"){
      outputResult = (int.parse(num1) * int.parse(num2)).toString();
    }else if(opp =="/"){
      outputResult = (int.parse(num1) / int.parse(num2)).toString();
    }
    setState(() {

    });
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
