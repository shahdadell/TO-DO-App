import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../HomeScreen/HomeScreen.dart';
import '../widgets/bnottom_sheet_widget.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = "register";

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

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
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title:  Text("Create Account",
              style: theme.textTheme.titleLarge,
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

                    CustomTextFiled(
                      labelText: 'Full Name',
                      controller: fullNameController,
                      validator: (String? value) {
                        if(value == null || value.trim().isEmpty){
                          return "You Must Enter Your Nme";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20,),
                    CustomTextFiled(
                      labelText: 'E-mail',
                      controller: emailController,
                      validator: (String? value) {
                        if(value == null || value.trim().isEmpty){
                          return "You Must Enter Your Email";
                        }
                        var regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
                    CustomTextFiled(
                      labelText: 'Confirm Password',
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
                        return "You Must Confirm Your Password";
                      }

                      if(value != passwordController.text){
                        return "Password doesn’t Match";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 50,),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context,HomeScreen.routeName);
                      register();
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
                  ],
                ),
              ),
            ),
          ) ,
        ),
    );
  }
   register() async {
    if(formKey.currentState!.validate()){

      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
