import 'package:flutter/material.dart';
import 'package:revisionproject/modal/userdata.dart';

class BackProfile extends StatefulWidget{
  const BackProfile({super.key, required this.user});

  final User user;

  @override
  State<BackProfile> createState() => _BackProfileState();
}

class _BackProfileState extends State<BackProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title:const Text("User Detail",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
      ),
      body: Container(
        padding:const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
                child: Image.asset(widget.user.image,height: 120,width: 120,fit: BoxFit.cover,)),
          const  SizedBox(height: 15,),
            Text("Name : ${widget.user.name}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            const   SizedBox(height: 8,),
            Text("Email : ${widget.user.email}",style:const TextStyle(fontSize: 18,color: Colors.black),),
            const    SizedBox(height: 8,),
            Text("Mobile :${widget.user.mobile}",style: const TextStyle(fontSize: 16,color: Colors.black),),
            const    SizedBox(height: 8,),
            Text("address : ${widget.user.address}",style: const TextStyle(fontSize: 16,color: Colors.black),),
          ],
        ),
      ),
    );
  }
}