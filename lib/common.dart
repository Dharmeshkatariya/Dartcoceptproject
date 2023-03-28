import 'dart:async';

import 'package:revisionproject/modal/userdata.dart';

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