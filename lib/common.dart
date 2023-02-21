import 'dart:async';

import 'package:revisionproject/userdata.dart';

class Common {

  static String operation(String num1, String num2, opp) {
    switch (opp) {
      case "+":
        return (int.parse(num1) + int.parse(num2)).toString();

      case "-":
        return (int.parse(num1) - int.parse(num2)).toString();

      case "*":
        return (int.parse(num1) * int.parse(num2)).toString();

      case "/":
        return (int.parse(num1) / int.parse(num2)).toString();

      default :
        return "0";
    }
  }

  static double average(double a, double b, double c) {
    double result = (a + b + c) / 3;
    return result;
  }


  static bool passing(int a, int b, int c) {
    if (a > 35 && b > 35 && c > 35) {
      return true;
    } else {
      return false;
    }
  }

  static String grading(double avr) {
    if (avr > 91 && avr <= 100) {
      return "A+";
    } else if (avr > 81 && avr < 90) {
      return "A";
    } else if (avr > 71 && avr < 80) {
      return "B+";
    } else if (avr > 61 && avr < 70) {
      return "B";
    } else if (avr > 51 && avr < 60) {
      return "C+";
    } else if (avr > 41 && avr < 50) {
      return "C";
    } else if (avr > 36 && avr < 40) {
      return "D+";
    } else {
      return "F";
    }
  }

  List<User> userList = [];


  var name = ["Dharmesh", "Ram", "Shyam", "Riya"];
  var email = [
    "dharmesh11@gmail.com",
    "Ram25@gmail.com",
    "Shyam6@gmail.com",
    "Riya1589@gmail.com"
  ];

  var mobile = [9099200145, 9099200455, 9045200145, 9094100145];
  var image = ["assets/icon/p1.jpg",
    "assets/icon/p2.jpg",
    "assets/icon/p3.jpg",
    "assets/icon/g1.jpg",
  ];
 var address =["Amreli","Surat","Rajkot","Baroda"];

  List<User> userData(){


    for(int i=0;i<name.length;i++){
      User user = User();
      user.name= name[i];
      user.email= email[i];
      user.image= image[i];
      user.mobile= mobile[i];
      user.address = address[i];
      userList.add(user);
    }

    return userList;
  }

  Future<String> getResult()async{
   return  'Result';
  }
}