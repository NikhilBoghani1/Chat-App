import 'package:chat_app/componets/my_button.dart';import 'package:chat_app/componets/my_textfield.dart';import 'package:chat_app/services/auth/auth_service.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';class LoginPage extends StatelessWidget {  //  Go to register Page  final void Function()? onTap;  LoginPage({super.key, required this.onTap});  TextEditingController _emailController = TextEditingController();  TextEditingController _passwordController = TextEditingController();  // login method  void login(BuildContext context) async {    final authService = AuthService();    // try login    try {      await authService.signInWithEmailPassword(        _emailController.text,        _passwordController.text,      );    }    // catch any errors    catch (e) {      showDialog(        context: context,        builder: (context) => AlertDialog(          title: Text(e.toString()),        ),      );    }  }  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: Theme.of(context).colorScheme.background,      body: SafeArea(        child: Center(          child: Column(            mainAxisAlignment: MainAxisAlignment.center,            children: <Widget>[              /* Logo */              Icon(                Icons.message,                size: 60,                color: Theme.of(context).colorScheme.primary,              ),              SizedBox(height: 50),              /* WelCome Back */              Text(                "Welcome back, you've been missed!",                style: TextStyle(                  color: Theme.of(context).colorScheme.primary,                  fontSize: 16,                ),              ),              SizedBox(height: 25),              /* email textfield */              MyTextField(                controller: _emailController,                obscureText: false,                hintText: 'Email',              ),              MyTextField(                controller: _passwordController,                obscureText: true,                hintText: 'Password',              ),              /* Button */              MyButton(                text: "Login",                onTap: () => login(context),              ),              SizedBox(height: 20),              /* register now */              Row(                mainAxisAlignment: MainAxisAlignment.center,                children: <Widget>[                  Text(                    'Not a member?',                    style:                        TextStyle(color: Theme.of(context).colorScheme.primary),                  ),                  SizedBox(width: 5),                  GestureDetector(                    onTap: onTap,                    child: Text(                      'Register now',                      style: TextStyle(                        color: Theme.of(context).colorScheme.primary,                        fontWeight: FontWeight.w500,                        fontSize: 16,                      ),                    ),                  ),                ],              ),            ],          ),        ),      ),    );  }}