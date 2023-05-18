import 'dart:io';

import 'package:advance_practice_app/data/user.dart';
import 'package:advance_practice_app/domain/firsthomestate.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var myAppState = MyInheritedWidget?.of(context);

    nameController.text = myAppState!.user!.name;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.cyanAccent,
          ),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.cyanAccent,
            size: 24,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            usersCard(
              controller: nameController,
                userimage: myAppState?.user != null ? myAppState!.user!.image : myAppState!.user!.image,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              onPressed: (){
                User newUser = User(name: nameController.text, image: MyInheritedWidget?.of(context)!.user!.image);
                MyInheritedWidget.of(context)?.updateUserProfile(newUser);
              }, child: const Text("Update", style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),),
            ),
          ],
        ),
      ),
    );
  }
}


class usersCard extends StatelessWidget {
File userimage;
TextEditingController controller;

  usersCard({super.key, required this.userimage, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          // height: 70,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.sentiment_satisfied, color: Colors.indigo, size: 30,)),
                title: TextField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  controller: controller,
                  //username, style: Theme.of(context).textTheme.bodyMedium,
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(userimage, fit: BoxFit.cover,),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
