// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailContorller = TextEditingController();
  final _passwordContorller = TextEditingController();
  final _confirmPasswordContorller = TextEditingController();
  final _firstNameContorller = TextEditingController();
  final _lastNameContorller = TextEditingController();
  final _ageContorller = TextEditingController();

  @override
  void dispose() {
    _emailContorller.dispose();
    _passwordContorller.dispose();
    _confirmPasswordContorller.dispose();
    _firstNameContorller.dispose();
    _lastNameContorller.dispose();
    _ageContorller.dispose();
    super.dispose();
  }

  Future singUp() async {
    await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
      email: _emailContorller.text.trim(),
      password: _passwordContorller.text.trim(),
    );
    // add user Dedtails 
    addUserDetails(
    _firstNameContorller.text.trim(),
    _lastNameContorller.text.trim(),
    _emailContorller.text.trim(),
    int.parse(_ageContorller.text.trim()),


    );      
    }
 
  
   


  // 
  Future addUserDetails(
    String firstname, String  lastname,  String email, int age ) async{
    await FirebaseFirestore.instance.collection('users').add({
    'firstname': firstname,
     'lastname': lastname,
      'email': email,
      'age': age,
 });
 }

   
    

  validateForm() {
    if (!_emailContorller.text.contains("@")) {
      print(_emailContorller.text);
      print("Email address is not Valid.");
    } else if (_passwordContorller.text.length < 4) {
      print(_passwordContorller.text);
      print("Password must be atleast 4 Characters.");
    } else {
      singUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 173, 165),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('LOgIN'),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.key,
                size: 100,
              ),

              const SizedBox(
                height: 30,
              ),

              // hellow again

              const Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Register billow with your details!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // firstname section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _firstNameContorller,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'first name',
                          fillColor: Color(100)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // last name  email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _lastNameContorller,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'last name',
                          fillColor: Color(100)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // age email
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _ageContorller,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'age',
                          fillColor: Color(100)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // text email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _emailContorller,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'email',
                          fillColor: Color(100)),
                    ),
                  ),
                ),
              ),
              // password TExt FIeld
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _passwordContorller,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password',
                          fillColor: Color(100)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // confirme password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _confirmPasswordContorller,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'confirm password',
                          fillColor: Color(100)),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //sing in buttom
              InkWell(
                onTap: validateForm,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Sing UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    )),
              ),

              const SizedBox(
                height: 10,
              ),
              // Not a member ? Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Iam a Member!',
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                      'Login Now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
 }
