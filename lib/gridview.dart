import 'package:flutter/material.dart';
import 'package:revisionproject/common.dart';
import 'package:revisionproject/userdata.dart';

import 'backprofile.dart';

class GridViewProfile extends StatefulWidget {
  const GridViewProfile({super.key});

  @override
  State<GridViewProfile> createState() => _GridViewProfileState();
}

class _GridViewProfileState extends State<GridViewProfile> {
  @override
  void initState() {
    // TODO: implement initState
    pList = Common().userData();
    super.initState();
  }

  List<User> pList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Of List"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(pList.length, (index) => gridItem(index)),
      ),
    );
  }

  Widget gridItem(int index) {
    User user = pList[index];
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: 
            BorderRadius.circular(40),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  BackProfile(user: user,)),
                );
              },
              child: Image.asset(
                user.image,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            "Name : ${user.name}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          const SizedBox(height: 5,),
          Text(
            overflow: TextOverflow.ellipsis,
            "Email:${user.email}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
