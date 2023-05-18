import 'package:advance_practice_app/data/user.dart';
import 'package:flutter/material.dart';

class AppStateWidget extends StatefulWidget {

  final Widget child;
  
  const AppStateWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class MyInheritedWidget extends InheritedWidget{
  // final String username = "Abdul Rehman Khan";

  final AppStateWidgetState state;

  MyInheritedWidget({required Widget child, required this.state}) : super(child: child);

  static AppStateWidgetState? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.state;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

}

class AppStateWidgetState extends State<AppStateWidget> {
  String? username = "Abdul Rehman Khan";

  User? user;

  updateUserProfile(User newUser) => setState((){
    user = newUser;
  });

  // updateUserName(String newUserName){
  //   setState(() {
  //     username = newUserName;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(state: this, child: widget.child);
  }
}






