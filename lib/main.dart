
import 'package:bs_js/src/views/pages/contact_page.dart';
import 'package:bs_js/src/views/pages/login_page.dart';
import 'package:bs_js/src/views/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Color.d),
      //   useMaterial3: true,
      // ),

      home: SignUpPage(),


    );
  }
}
