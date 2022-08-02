import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

import 'ForgotPasswordPage.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  //   bool _obscureText = false;
  // late String _password;

  // // Toggles the password show status
  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  //   @override
  // void initState() {
  //   // TODO: implement initState
    
  //   super.initState();
  // }

  
  final _formKey = GlobalKey<FormState>();

// GlobalKey>FormState> formkey = GlobalKey<FormState>();
// text contoroller

  final _emailContorller = TextEditingController();
  final _passwordContorller = TextEditingController();
  // final _NumberContorller =TextEditingController();

// sing function
  Future singIn() async {
    // circule peogerss

    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailContorller.text.trim(),
      password: _passwordContorller.text.trim(),
    );

    // navigator pup loadinf
    Navigator.of(context).pop();
  }
  

  void dispose() {
    _emailContorller.dispose();
    _passwordContorller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('LOgIN'),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Icon(
              //   Icons.login,
              //   size: 100,
              // ),

              const SizedBox(
                height: 190,
              ),

              // hellow again

              Text(
                'Hello Dear!',
                style: GoogleFonts.montaga(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   'Welcome Back You Have Missed Here!',
              //   style: GoogleFonts.lobster(
              //     textStyle: const TextStyle(
              //       fontSize: 27,
              //     ),
              //   ),

              //   // style: TextStyle(
              //   //   fontSize: 20,
              //   // ),
              // ),
              const SizedBox(
                height: 50,
              ),

              // text email
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.grey[200],
              //       border: Border.all(color: Colors.white),
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 18),
              //       child: TextField(
              //         key: _formKey,
              //         controller: _emailContorller,
              //         decoration: const InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'Email',
              //           prefixIcon: Icon(Icons.email,
              //           size: 20,
              //           color: Colors.black,)
              //         ),
                      
              //       ),
              //     ),
              //   ),
              // ),
              // password TExt FIeld
              const SizedBox(
                height: 10,
              ),
              Center(
                    child: TextField(
                  controller: _emailContorller,
                  cursorColor: Color.fromARGB(255, 0, 0, 0),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                    ),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email,
                        size: 20,
                        color: Colors.black,),

                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      letterSpacing: 1.0,
                    ),
                  ),
                )),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.grey[200],
              //       border: Border.all(color: Colors.white),
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 18),
              //       child: TextField(
              //         controller: _passwordContorller,
              //         obscureText: true,
                      
              //         decoration: const InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'Password',
              //            prefixIcon: Icon(Icons.lock,
              //           size: 20,
              //           color: Colors.black,),
              //         ),
                      
              //       ),
              //     ),
              //   ),
              // ),
              Center(
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    controller: _passwordContorller,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock,
                        size: 20,
                        color: Colors.black,),
                      
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        letterSpacing: 1.0,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility_off : Icons.visibility,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ),
              // TextFormField(
              //   // The validator receives the text that the user has entered.
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter Email and Password';
              //     } else
              //       return null;
              //   },
              // ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        )),
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Validate returns true if the form is valid, or false otherwise.
              //     if (_formKey.currentState!.validate()) {
              //       // If the form is valid, display a snackbar. In the real world,
              //       // you'd often call a server or save the information in a database.
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text('Processing Data')),
              //       );
              //     }
              //   },
              //   child: const Text('Submit'),
              // ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              //sing in buttom
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: GestureDetector(
                      onTap: singIn,
                      child: Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Sing IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ))),
              const SizedBox(
                height: 10,
              ),
              // Not a member ? Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a Member',
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      'Rigister Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
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
