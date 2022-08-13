// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/phone_verificaton/login.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('soo dhawaaw maaro '),
         ),
         floatingActionButton: FloatingActionButton(
          onPressed: () async{
            await _auth.signOut();
               Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      
          },
          child: const Icon(Icons.logout),
          ),
    );
  }
}