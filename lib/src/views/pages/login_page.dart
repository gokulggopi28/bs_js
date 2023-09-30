import 'package:bs_js/src/core/common_widgets/app_button.dart';
import 'package:bs_js/src/core/helpers/validation_helper.dart';
import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text("Login"),
      )),
      body: SafeArea(
        
          child: Form(
            key: _formKey ,
              child: Padding(
                padding: const EdgeInsets.only(top: 130.0,left: 30,right: 30),
                child: Column(
        children: [

          Text("Login",style: TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold,
          ),),
          SizedBox(height:40),
          TextFormField(
            controller: emailController,
            validator: ValidationHelpers.validateEmail,

            decoration: InputDecoration(
                enabledBorder:(
                OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.greenAccent
                  )
                )
                ),label: Text(Strings.email)),
          ),

          SizedBox(height: 20,),
          TextFormField(
            controller: passwordController,
               validator: ValidationHelpers.validatePassword,
              decoration: InputDecoration(
              enabledBorder:(
                  OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          color: Colors.greenAccent
                      )
                  )
              ),
                label: Text(Strings.password),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20,),

          AppButton(buttonTitle: Strings.login, onPressed: (){
            if(_formKey.currentState?.validate() ?? false){
              String email = emailController.text;
              String password = passwordController.text;
            }
          }),
          SizedBox(height: 20,),

        ],
      ),
              ))),
    );
  }
}
