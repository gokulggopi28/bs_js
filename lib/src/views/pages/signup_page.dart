import 'package:bs_js/src/core/common_widgets/app_button.dart';
import 'package:bs_js/src/core/helpers/validation_helper.dart';
import 'package:bs_js/src/core/theme/app_text_form.dart';
import 'package:bs_js/src/views/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text("Sign Up"),
      )),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("SignUp to your Account", style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                  SizedBox(
                    height: 50,
                  ),
                  AppTextFormField(
                      label: Strings.name,
                      keyboardType: TextInputType.name,
                      textEditingController: _nameController,
                      validator: ValidationHelpers.validateName),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextFormField(
                      label: Strings.email,
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: _emailController,
                      validator: ValidationHelpers.validateEmail),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextFormField(
                      label: Strings.phone,
                      keyboardType: TextInputType.phone,
                      textEditingController: _phoneController,
                      validator: ValidationHelpers.validatePhone),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextFormField(
                      label: Strings.dob,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            initialDate: DateTime.now()
                                .subtract(const Duration(days: 365 * 18)),
                            lastDate: DateTime.now()
                                .subtract(const Duration(days: 365 * 5)));

                        if (selectedDate == null) {
                          selectedDate = DateTime.now()
                              .subtract(const Duration(days: 365 * 18));
                        }
                        _dobController.text =
                            selectedDate.toString().substring(0, 10);
                      },
                      keyboardType: TextInputType.datetime,
                      textEditingController: _dobController,
                      validator: ValidationHelpers.checkIsNullOrEmpty),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextFormField(
                    label: Strings.password,
                    isObscure: true,
                    textEditingController: _passwordController,
                    validator: ValidationHelpers.validatePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextFormField(
                    label: Strings.confirmPassword,
                    textEditingController: _confirmController,
                    isObscure: true,
                    validator: (val) {
                      return ValidationHelpers.validateConfirmPassword(
                          _passwordController.text, val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppButton(
                      buttonTitle: Strings.signUp,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          String email = _emailController.text.trim();
                          String name = _nameController.text.trim();
                          String password = _passwordController.text;
                          String phone = _phoneController.text;
                          String dob = _dobController.text.trim();
                        }
                      }),
                  SizedBox(height: 30),
                  Text("Already Have an Account?", style: TextStyle(fontSize: 15),),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage())
                    );
                  },
                  child: Text("Login"))
                ],
              ),
            )),
      ),
    );
  }
}
