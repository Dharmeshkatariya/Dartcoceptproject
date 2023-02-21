import 'package:flutter/material.dart';

class SecondString extends StatefulWidget {
  const SecondString({super.key});

  @override
  State<SecondString> createState() => _SecondStringState();
}

class _SecondStringState extends State<SecondString> {
  final _s1Controller = TextEditingController();
  final _s2Controller = TextEditingController();
  bool isVisible = false;
  String outputResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: const Text("String Function"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textFieldData(controller: _s1Controller),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Result : $outputResult",
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
                    _commaSeparate();
                  }),
              _containerData(
                  text: "Real Input",
                  onTap: () {
                    _realInput();
                  }),
              _containerData(
                  text: "First Five Char",
                  onTap: () {
                    _firstChar();
                  }),
              _containerData(
                  text: "Last Five Char",
                  onTap: () {
                    _lastChar();
                  }),
              Visibility(visible: isVisible, child: _textFieldData(controller: _s2Controller)),
              _containerData(
                  text: "Add 2 String",
                  onTap: () {
                    _addString();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _addString() {
    isVisible = true;
    if(_s2Controller.text.isNotEmpty) {
      outputResult = _s1Controller.text +  _s2Controller.text;
    }
    setState(() {});
  }

  _lastChar() {
    if (_s1Controller.text.length > 5) {
      outputResult =
          _s1Controller.text.substring(_s1Controller.text.length - 5);
    }
    setState(() {});
  }

  _firstChar() {
    if (_s1Controller.text.length > 5) {
      outputResult = _s1Controller.text.substring(0, 5);
    }
    setState(() {});
  }

  _realInput() {
    var array = [];
    array = outputResult.split(",");
    outputResult = array.join();
    setState(() {});
  }

  _commaSeparate() {
    if (_s1Controller.text.isNotEmpty) outputResult = "";
    String result = "";
    result = _s1Controller.text.toUpperCase();
    for (int i = 0; i < result.length; i++) {
      outputResult += "${result[i]},";
    }
    setState(() {});
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
