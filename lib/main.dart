import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revisionproject/route/names_route.dart';
import 'package:revisionproject/route/pageroute.dart';
import 'package:revisionproject/screen/evenodd.dart';
import 'package:revisionproject/screen/result.dart';
import 'package:revisionproject/screen/string.dart';
import 'package:revisionproject/screen/string2.dart';
import 'screen/gridview.dart';
import 'screen/listview.dart';
import 'screen/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      getPages: PageRoutes.pages,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 65,
                ),
                _getwidget(
                    text: "Even/Odd",
                    onTab: () {
                      Get.toNamed(NameRoute.evenOddScreen);
                    }),
                _getwidget(
                    text: "String",
                    onTab: () {
                      Get.toNamed(NameRoute.strScreenPage);
                    }),
                _getwidget(
                    text: "Result",
                    onTab: () {
                      Get.to(const StudentResult());
                    }),
                _getwidget(
                    text: "Calculator",
                    onTab: () {
                     Get.toNamed(NameRoute.calculatorScreen);
                    }),
                _getwidget(
                    text: "Listview",
                    onTab: () {
                      Get.to(const ListViewProfile());
                    }),
                _getwidget(
                    text: "GridView",
                    onTab: () {
                      Get.to(const GridViewProfile());
                    }),
                _getwidget(
                    text: "Login",
                    onTab: () {
                      Get.to(const LoginPage());
                    }),
                _getwidget(
                    text: "String 2",
                    onTab: () {
                      Get.toNamed(NameRoute.secondString);
                    }),
                _getwidget(
                    text: "Calculator 2",
                    onTab: () {
                      Get.toNamed(NameRoute.calculator2Screen);
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
