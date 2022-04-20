import 'dart:io';
import 'package:flutter/material.dart';
import 'package:thenextlevel/main.dart';

class LangView extends StatefulWidget {
  const LangView({Key? key}) : super(key: key);

  @override
  _LangViewState createState() => _LangViewState();
}

class _LangViewState extends State<LangView> {
  String lang ="";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(



      body:Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [  Color(0xFFD9D9D9), Color(0x005c5c5c)],transform: GradientRotation(35.0))
        ),
        child: Padding(

          padding: const EdgeInsets.all(20.0),
          child: Center(child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height-(30*(MediaQuery.of(context).size.height))/100,
                child: Image.asset("images/logo.png")
                ,
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    Text('يرجى اختيار لغتك ',style:TextStyle(color: Colors.black54)),Text('Please Select Your Language',style:TextStyle(color: Colors.black54))
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: () async {
                      try {
                        final result = await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                          print('connected');
                        }
                      } on SocketException catch (_) {
                        print('not connected');
                      }
                      lang="en";
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>  MainScreen(lang)));
                    }, child: Container(
                    width:300 ,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      boxShadow: const [
                        BoxShadow(color:  Color(0xFF0E8F38), spreadRadius: 1),
                      ],
                    ),
                    child: const Center(child: Text("English",style:TextStyle(color: Colors.white) ,)))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: () async {
                      try {
                        final result = await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                          print('connected');
                        }
                      } on SocketException catch (_) {
                        print('not connected');
                      }
                      lang="ar";
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => MainScreen(lang)));
                    }, child: Container(
                    width:300 ,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      boxShadow: const [
                        BoxShadow(color:  Color(0xFF0E8F38), spreadRadius: 1),
                      ],

                    ),
                    child: const Center(child: Text("العربية",style:TextStyle(color: Colors.white) ,)))),
              ),
            ],
          )),
        ),
      ),);
  }
}