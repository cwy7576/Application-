import 'package:flutter/material.dart';
import 'package:login_ui/pages/Register_Page.dart';
import 'package:login_ui/pages/login_ui_page.dart';




class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initial show login page
  bool showLoginPage =true;

  void togglescreen(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(showRegisterPage: togglescreen);
    }else{
      return RegisterPage(showLoginPage: togglescreen);
    }
  }
  }

