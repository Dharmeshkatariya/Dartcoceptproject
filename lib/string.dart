import 'package:flutter/material.dart';

class StringProfile extends StatefulWidget {
  const StringProfile({super.key});

  @override
  State<StringProfile> createState() => _StringProfileState();
}

class _StringProfileState extends State<StringProfile> {
  final _s1Controller = TextEditingController();
  final _s2Controller = TextEditingController();

  String outputResult = "";
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title:const Text(
          "String Function",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.all(25),
          width: double.infinity,
          child: Column(
            children: [
              _textField(controller: _s1Controller),
              const  SizedBox(
                height: 20,
              ),
              Text(
                "Result : $outputResult",
                style:const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              _containerData(
                  text: "Comma Separate",
                  onTab: () {
                    _commaSeparate();
                  }),
              _containerData(
                  text: "Real Input",
                  onTab: () {
                    _realInput();
                  }),
              _containerData(
                  text: "First Five Char",
                  onTab: () {
                    _firstChar();
                  }),
              _containerData(
                  text: "Last Five Char",
                  onTab: () {
                    _lastChar();
                  }),
              Visibility(
                  visible: isVisible,
                  child: _textField(controller: _s2Controller)),
              _containerData(
                  text: "Add 2 String",
                  onTab: () {
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
    if (_s2Controller.text.isNotEmpty) {
      outputResult = _s1Controller.text + _s2Controller.text;
    }
    setState(() {});
  }

  _lastChar() {
    if (_s1Controller.text.length > 5) {
      outputResult = _s1Controller.text.substring(_s1Controller.text.length - 5);
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
    var array = outputResult.split(",");
    outputResult = array.join();
    setState(() {});
  }

  _commaSeparate() {
    if (_s1Controller.text.isNotEmpty) outputResult = "";
    String result = _s1Controller.text.toUpperCase();

    for (int i = 0; i < result.length; i++) {
      outputResult += "${result[i]},";
    }
    setState(() {});
  }

  Widget _textField({required TextEditingController controller}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border:const OutlineInputBorder(),
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
        margin:const EdgeInsets.all(30),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
