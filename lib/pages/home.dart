// ignore_for_file: non_constant_identifier_names


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/read%20data/get_user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User = FirebaseAuth.instance.currentUser!;


// document IDs

List <String> docsIDS = [];


// ger docIDs

Future getDocId() async{

  await FirebaseFirestore.instance.collection('users').get().then(
    (snapshot) => snapshot.docs.forEach((document) {
      print(document.reference);
      docsIDS.add(document.reference.id);
    },
    ),
    );
}

@override
  void initState() {
    getDocId();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
 backgroundColor: Color.fromARGB(255, 2, 173, 165),        title:  Text( User.email!,
        style: TextStyle(fontSize: 16.0),
        
        ),
        actions: [
          GestureDetector(
            onTap: () {
        FirebaseAuth.instance.signOut();

            },
            child: Icon(Icons.logout),
            
            ),
              ],
          ),
      
    
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Expanded(

              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                return  ListView.builder(
                itemCount: docsIDS.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: GetUserName(documentId: docsIDS[index],),
                    tileColor: Color.fromARGB(255, 88, 235, 240),
                    
                  ),
                );

              } 
              );
              },
              )
             
              ),
          
          ]
          ),
      )
    
    );
  }
}
