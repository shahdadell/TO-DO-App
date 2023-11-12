import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../HomeScreen/HomeScreen.dart';
import '../widgets/bnottom_sheet_widget.dart';
import '../register/register.dart';

class LoginView extends StatefulWidget {

  static const String routeName = "login";

  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isVisable = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
            color: theme.colorScheme.onSecondary,
            image: const DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 150,
            title: const Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                )
            ),
            centerTitle: true,
          ),
          body:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*.12,),
                    Text("Welcome Back!",
                      style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 40,),
                    CustomTextFiled(
                      labelText: 'E-mail',
                      controller: emailController,
                      validator: (String? value) {
                        if(value == null || value.trim().isEmpty){
                          return "You Must Enter Your Email";
                        }
                        var regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9-!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if(!regex.hasMatch(value)){
                          return "Invalid E-mail Address";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20,),
                    CustomTextFiled(
                      labelText: 'Password',
                      obscureText: !isVisable,
                      suffix: GestureDetector(
                        onTap: () {
                          isVisable = !isVisable;
                          setState(() {

                          });
                        },
                        child: isVisable == false ?
                        const Icon(Icons.visibility_off_outlined,
                          size: 28,)
                            : const Icon(Icons.visibility_outlined,
                          size: 28,),
                      ),
                      controller: passwordController,
                      validator: (String? value) {
                        if(value == null || value.trim().isEmpty){
                          return "You Must Enter Your Password";
                        }
                        var regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~]).{8,}$');
                        if(!regex.hasMatch(value)){
                          return "Invalid Password";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context,RegisterView.routeName);
                        },
                        child: Text("Forgot Password ?",
                          textAlign: TextAlign.start,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context,HomeScreen.routeName);
                        login();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        height: 55,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Login",
                                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white)
                            ),
                            const Icon(Icons.arrow_right_alt_sharp,
                              color: Colors.white,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context,RegisterView.routeName);
                        },
                        child: Text("OR Create New Account !",
                          textAlign: TextAlign.start,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ) ,
        ));
  }

  void login() async {
    if(formKey.currentState!.validate()){

      try{
        var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
       print(user.user!.email);
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
      

    }
  }
}
