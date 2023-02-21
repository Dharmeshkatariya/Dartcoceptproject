import 'package:flutter/material.dart';
import 'package:revisionproject/common.dart';
import 'package:revisionproject/evenodd.dart';
import 'package:revisionproject/result.dart';
import 'package:revisionproject/string.dart';
import 'package:revisionproject/string2.dart';
import 'calculator.dart';
import 'calculator2.dart';
import 'gridview.dart';
import 'listview.dart';
import 'loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    _results();
    super.initState();
  }

  _results() async{
    String reuslt = await Common().getResult();
    print('--------------============$reuslt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const  SizedBox(
                  height: 65,
                ),
                _getwidget(
                    text: "Even/Odd",
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const EvenOddProfile()),
                      );
                    }),
                _getwidget(
                    text: "String",
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const StringProfile()),
                      );
                    }),
                _getwidget(
                    text: "Result",
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const StudentResult()),
                      );
                    }),
                _getwidget(
                    text: "Calculator",
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const CalculatorPage()),
                      );
                    }),
                _getwidget(text: "Listview",onTab: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListViewProfile()),
                  );
                }),
                _getwidget(text: "GridView",onTab: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GridViewProfile()),
                  );
                }),
                _getwidget(
                    text: "Login",
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    }),
                _getwidget(text: "String 2",onTab: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondString()),
                  );
                }),
                _getwidget(text: "Calculator 2",onTab: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CalculatorApp()),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getwidget({required String text, GestureTapCallback? onTab}) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red[500],
          borderRadius: BorderRadius.circular(25),
        ),
        margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
