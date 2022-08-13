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

  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

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
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      String firstname, String lastname, String email, int age) async {
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('LOgIN'),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(
            Icons.app_registration,
            size: 100,
          ),

          const SizedBox(
            height: 15,
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
            height: 0,
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
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                        letterSpacing: 1.0,
                      ),
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
                padding: const EdgeInsets.only(left: 18),
                child: TextField(
                  controller: _lastNameContorller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                        letterSpacing: 1.0,
                      ),
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
                  controller: _ageContorller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Age',
                      hintStyle: TextStyle(
                        letterSpacing: 1.0,
                      ),
                      fillColor: Color(100)),
                ),
              ),
            ),
          ),
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: TextField(
                    controller: _emailContorller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        size: 17,
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: TextField(
                    obscureText: _isHidden,
                    controller: _passwordContorller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'password',
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 17,
                        color: Colors.black,
                      ),
                      hintStyle: const TextStyle(
                        letterSpacing: 1.0,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility_off : Icons.visibility,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: TextField(
                    obscureText: _isHidden,
                    controller: _confirmPasswordContorller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'confirm password',
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 17,
                        color: Colors.black,
                      ),
                      hintStyle: const TextStyle(
                        letterSpacing: 1.0,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility_off : Icons.visibility,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

            const SizedBox(
              height: 10,
            ),
          //   //sing in buttom
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
                    )),),
          //   ),

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
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  )
              ],
            ),
          // ,
        ])),
      ),
    );
  }
}
