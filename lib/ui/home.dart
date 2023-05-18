import 'dart:io';

import 'package:advance_practice_app/data/user.dart';
import 'package:advance_practice_app/domain/firsthomestate.dart';
import 'package:advance_practice_app/ui/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  XFile? pickedImage;

  pickImage(BuildContext context)async{
    try{
      final ImagePicker picker = ImagePicker();
      pickedImage  = await picker.pickImage(source: ImageSource.gallery);
      // if(pickedImage == null){
      //   const SnackBar(
      //     duration: Duration(seconds: 2),
      //     content: Text("Sorry! Upload Image"),
      //   );
      // } else{
      //   print("Image Upload Success");
      // }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  updateProfile(BuildContext context){
    var myAppState = MyInheritedWidget?.of(context);
    myAppState?.updateUserProfile(User(name: nameController.text, image: File(pickedImage?.path ?? 'Image Not Found')));
    const SnackBar(
      duration: Duration(seconds: 2),
        content: Text("Hurray! All Done"),
    );
  }

  @override
  Widget build(BuildContext context) {
    // with out declaration in class
    // var username = context.dependOnInheritedWidgetOfExactType<UserStateWidget>();

    // with class declaration
    var myAppState = MyInheritedWidget.of(context);

    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.cyanAccent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 5,
              ),
              Text(
                myAppState?.user == null ? '${myAppState?.username}' : myAppState!.user!.name, style:
                Theme.of(context).textTheme.headlineMedium,
                  // '${User('Khalid', 24)}'
              ),
              SizedBox(
                height: height * 3,
              ),


              InkWell(
                onTap: (){
                  pickImage(context);
                },
                child: myAppState?.user == null ? const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.image),
                ) :
                Image.file(myAppState!.user!.image, height: 300, width: 300,),
              ),

              SizedBox(
                height: height * 2,
              ),

              Text(
                myAppState?.user == null ? "Please Select Image" : "Hurray! Image Upload Success",
              ),

              SizedBox(
                height: height * 3,
              ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(

                  controller: nameController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Apna Naam Dalo Yaha",
                  ),
                ),
              ),

              SizedBox(
                height: height * 3,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        updateProfile(context);
                      }, child: const Text("Update Profile")
                  ),
                  SizedBox(
                    width: width * 1,
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
                      }, child: const Text("See Profile")
                  ),
                ],
              ),

              // ElevatedButton(
              //     onPressed: (){
              //       myAppState?.updateUserName("Kesa Laga Mera Mazak");
              //     }, child: const Text("Change Name")),
            ],
          ),
        ),
      ),
    );
  }
}
