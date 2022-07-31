import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:login_ui/phone_verificaton/Home2.dart';
// import 'package:login_ui/phone_verificaton/login.dart';
import 'package:login_ui/pages/main_page.dart';

import 'culculator/home.dart';
import 'phone_verificaton/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: HomePahe()
        );
  }
}

// class InitializerWidget extends StatefulWidget {
//   const InitializerWidget({ Key? key }) : super(key: key);

//   @override
//   State<InitializerWidget> createState() => _InitializerWidgetState();
// }

// class _InitializerWidgetState extends State<InitializerWidget> {

//   late FirebaseAuth _auth;
//   late User _user;
//   bool isLoading= true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth.currentUser!;
//     isLoading = false;

//   }
//   @override
//   Widget build(BuildContext context) {
//     return isLoading?  const Scaffold(
//       body: Center(child: CircularProgressIndicator(),
//       ),
//     ):_user == null?const LoginScreen():HomeScreen();
//   }
// }
