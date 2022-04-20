import 'dart:async';

import 'package:flutter/material.dart';

import 'lang_screen.dart';
import 'main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    Timer(
        const Duration(seconds: 4),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const LangView())));
    var assetsImage = const AssetImage(
        'images/logo.png');
    var image =Image.asset("images/logo.png");
    return  Scaffold(

      body: Container(
        width: double.infinity,
        height:double.infinity ,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [  Color(0xFFECECEC), Color(0x005c5c5c)],transform: GradientRotation(35.0))
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: image,
          ),
        ),
      ),
    );
  }
}