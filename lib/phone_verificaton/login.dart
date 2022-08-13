// ignore_for_file: deprecated_member_use, non_constant_identifier_names, avoid_types_as_parameter_names, constant_identifier_names


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/phone_verificaton/Home2.dart';



enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class SHOW_MOBILE_FORM_STATE {}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneCotoroller = TextEditingController();
  final otpCotoroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  bool showLoading = false;

  void signInWithPhoneAuthCredential(phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final AuthCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (AuthCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    } on FirebaseAuth catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: phoneCotoroller,
          decoration: const InputDecoration(
            
            hintText: "Phone Number",
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });
            await _auth.verifyPhoneNumber(
              phoneNumber: phoneCotoroller.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                _scaffoldKey.currentState?.showSnackBar(
                    SnackBar(content: Text(verificationFailed.message!)));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: const Text('Send'),
          color: const Color.fromARGB(255, 3, 10, 217),
          textColor: Colors.white,
        ),
        const Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: otpCotoroller,
          decoration: const InputDecoration(
            hintText: " Enter OTP",
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        FlatButton(
          onPressed: () async {
         final phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: otpCotoroller.text);

            signInWithPhoneAuthCredential(phoneAuthCredential); 
          },
          child: const Text('Verify'),
          color: const Color.fromARGB(255, 11, 0, 220),
          textColor: Colors.white,
        ),
        const Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 2, 7, 105),

        title: const Center(child: Text('Phone Verification')),
      ),
      key: _scaffoldKey,
      body: Container(
        child: showLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
        padding: const EdgeInsets.all(10),
      ),
    );
  }

  // appBar: AppBar(
  //   backgroundColor: const Color.fromARGB(255, 255, 108, 3),
  //   title: const Text('Phone Auth'),
  // ),
  // body: Column(
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     Column(children: [
  //       Container(
  //         margin: const EdgeInsets.only(top: 60),
  //         child: const Center(
  //           child: Text(
  //             'Phone Authentication',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
  //           ),
  //         ),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
  //         child: TextField(
  //           decoration: const InputDecoration(
  //             hintText: 'Phone Number',
  //             prefix: Padding(
  //               padding: EdgeInsets.all(4),
  //               child: Text('+252'),
  //             ),
  //           ),
  //           maxLength: 10,
  //           keyboardType: TextInputType.number,
  //           controller: _controller,
  //         ),
  //       )
  //     ]),
  //     Container(
  //       margin: const EdgeInsets.all(10),
  //       width: double.infinity,
  //       child: FlatButton(
  //         color: const Color.fromARGB(255, 243, 128, 33),
  //         onPressed: () {
  //           Navigator.of(context).push(MaterialPageRoute(
  //               builder: (context) => OTPScreen(_controller.text)));
  //         },
  //         child: const Text(
  //           'Next',
  //           style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
  //         ),
  //       ),
  //     )
  //   ],
  // ),

}
