import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Signed In as:'+ User.email!),
              MaterialButton(onPressed: () {
                FirebaseAuth.instance.signOut();
                
              },
                color: Colors.deepOrange,
                child: Text('Signed Out'),
              ),
            ]),
        ),
      ),

    );
    
  }
}
