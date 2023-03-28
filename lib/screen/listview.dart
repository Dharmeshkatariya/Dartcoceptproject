import 'package:flutter/material.dart';
import 'package:revisionproject/common.dart';
import 'package:revisionproject/modal/userdata.dart';

import 'backprofile.dart';

class ListViewProfile extends StatefulWidget {
  const ListViewProfile({super.key});

  @override
  State<ListViewProfile> createState() => _ListViewProfileState();
}

class _ListViewProfileState extends State<ListViewProfile> {
  @override
  void initState() {
    // TODO: implement initState
    uList = Common().userData();
    super.initState();
  }

  List<User> uList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: const Text(
          "List Of User",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: uList.length,
          itemBuilder: (BuildContext context, int index) {
            return _listItem(index);
          }),
    );
  }

  Widget _listItem(int index) {
    User user = uList[index];

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BackProfile(
                                  user: user,
                                )),
                      );
                    },
                    child: Image.asset(
                      user.image,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ))),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name : ${user.name}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    "Email: ${user.email}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
