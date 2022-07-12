// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key,  required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailContorller = TextEditingController();
  final _passwordContorller = TextEditingController();
  final _confirmPasswordContorller =TextEditingController();

  @override
  void dispose() {
    _emailContorller.dispose();
    _passwordContorller.dispose();
    _confirmPasswordContorller.dispose();
    super.dispose();
  }

  Future singUp() async {
    final User? firebaseUser =  (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailContorller.text.trim(),
        password: _passwordContorller.text.trim(),
    ).catchError((msg){
      print("Error: " + msg.toString());
    }))
        .user;

    return firebaseUser;
  }


  validateForm() {
    if (!_emailContorller.text.contains("@")) {
      print(_emailContorller.text);
      print("Email address is not Valid.");
    }  else if (_passwordContorller.text.length < 6) {
      print(_passwordContorller.text);
      print("Password must be atleast 6 Characters.");
    } else {
      singUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 33, 82),
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
                height: 80,
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
                height: 10,
              ),
              const Text(
                'Register billow with your details!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
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
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _emailContorller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
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
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _passwordContorller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
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
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _confirmPasswordContorller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                        
                        filled: true
                      ),
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
                        color: Colors.white
                      ),
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
