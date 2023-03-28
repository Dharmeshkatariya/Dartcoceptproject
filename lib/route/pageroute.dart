import 'package:get/get.dart';
import 'package:revisionproject/binding/calculator_binding.dart';
import 'package:revisionproject/binding/evenodd_binding.dart';
import 'package:revisionproject/binding/string-binding.dart';
import 'package:revisionproject/route/names_route.dart';
import 'package:revisionproject/screen/calculator2.dart';
import 'package:revisionproject/screen/evenodd.dart';
import 'package:revisionproject/screen/string.dart';
import 'package:revisionproject/screen/string2.dart';

import '../screen/calculator.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: NameRoute.calculatorScreen,
      page: () => CalculatorPage(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: NameRoute.calculator2Screen,
      page: () => CalculatorApp(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: NameRoute.evenOddScreen,
      page: () => EvenOddProfile(),
      binding: EvenOddBinding(),
    ),
    GetPage(
      name: NameRoute.strScreenPage,
      page: () => StrScreenPage(),
      binding: StrScreenPageBinding(),
    ),
    GetPage(
      name: NameRoute.secondString,
      page: () => SecondString(),
      binding: StrScreenPageBinding(),
    ),
  ];
}
