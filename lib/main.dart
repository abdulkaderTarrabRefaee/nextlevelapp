import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thenextlevel/lang_screen.dart';
import 'package:thenextlevel/splash.dart';
import 'package:thenextlevel/flutter_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

class MainScreen extends StatefulWidget {
  String lang;

  MainScreen(this.lang, {Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String appName = "";
  late String mainPage = "";
  late String aboutUs = "";
  late String courses = "";
  late String shop = "";
  late String contact = "";

  late String aboutUsUrl = "";
  late String coursesUrl = "";
  late String shopUrl = "";
  late String contactUrl = "";
  late String sout = "";

  String url = "https://nextlevelkw.com";
  late WebViewController _webController;
  late final GlobalKey _menuKey = GlobalKey();

  Future<bool> _onWillPop() async {
    if (await _webController.canGoBack()) {
      await _webController.goBack();
    }
    return false;
  }

  late bool loadingApp = true;
  late bool internetNotConnction = false;

  @override
  initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    if (widget.lang == "ar") {
      appName = "القائمة الرئيسية";
      url = "https://nextlevelkw.com/index.php/home-mob?lang=ar";
      mainPage = "الصفحة الرئيسية ";
      aboutUs = "من نحن";
      sout = "تسجيل خروج";

      courses = "الدورات التدريبية ";
      shop = "المتجر";
      contact = "اتصل بنا ";
      aboutUsUrl = "https://nextlevelkw.com/index.php/about/?lang=ar";
      coursesUrl = "https://nextlevelkw.com/index.php/courses-2/?lang=ar";
      shopUrl = "https://nextlevelkw.com/index.php/shop-3/?lang=ar";
      contactUrl = "https://nextlevelkw.com/index.php/contact/?lang=ar";
    } else if (widget.lang == "en") {
      url = "https://nextlevelkw.com/index.php/home-mob/";
      appName = "Main Menu";
      mainPage = "Home ";
      aboutUs = "About Us";
      courses = "Courses ";
      shop = "Shop";
      contact = "Contact Us";
      sout = "Sing Out";

      aboutUsUrl = "https://nextlevelkw.com/index.php/about";
      coursesUrl = "https://nextlevelkw.com/index.php/courses-2";
      shopUrl = "https://nextlevelkw.com/index.php/shop-3";
      contactUrl = "https://nextlevelkw.com/index.php/contact";
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle cairo = GoogleFonts.cairo(
        fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white);

    return MaterialApp(
      title: "NextLevel",
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(

              title: const Center(
                  child: Image(
                image: AssetImage("images/logowt.png"),
                width: 200,
              )),
              backgroundColor: const Color(0xFF004E1E)),
          drawer: Drawer(


            backgroundColor: const Color(0xFF004E1E),

            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/abb.png"),
                      fit: BoxFit.cover,
                      opacity: 0.2),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF004E1E), Color(0xFF008E1E)],
                      transform: GradientRotation(35.0))),
              child: ListView(

                padding: EdgeInsets.zero,

                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(),
                    padding: const EdgeInsets.all(25),
                    child: Image.asset("images/logowhite.png"),
                  ),
                  ListTile(
                    trailing:const Icon(
                        Icons.home
                    ),
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    selectedColor: Colors.white,
                    selectedTileColor: Colors.white,
                    iconColor:Colors.white ,
                    selected: true,
                    dense: true,
                    autofocus: true,

                    title: Text(mainPage,
                        textDirection: widget.lang == "ar"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: cairo),
                    onTap: () {
                      _webController.loadUrl(url);
                    },
                  ),
                  const Divider(
                      height: 10, thickness: 1, color: Color(0x5E008E33)),
                  ListTile(
                    iconColor:Colors.white ,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    selectedColor: Colors.white,
                    selectedTileColor: Colors.white,
                    trailing:const Icon(
                        Icons.add_comment_rounded
                    ),
                    title: Text(aboutUs,
                        textDirection: widget.lang == "ar"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: cairo),
                    onTap: () {
                      _webController.loadUrl(aboutUsUrl);
                    },
                  ),
                  const Divider(
                      height: 10, thickness: 1, color: Color(0x5E008E33)),
                  ListTile(
                    selected: true,

                    iconColor:Colors.white ,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    selectedColor: Colors.white,
                    selectedTileColor: Colors.white,
                    trailing:const Icon(
                        Icons.analytics_outlined
                    ),
                    title: Text(courses,
                        textDirection: widget.lang == "ar"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: cairo),
                    onTap: () {


                      _webController.loadUrl(coursesUrl);
                    },
                  ),
                  const Divider(
                      height: 10, thickness: 1, color: Color(0x5E008E33)),
                  ListTile(
                    selected: true,

                    iconColor:Colors.white ,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    selectedColor: Colors.white,
                    selectedTileColor: Colors.white,

                    trailing:const Icon(

                        Icons.shopping_cart_outlined
                    ),


                    title: Text(shop,
                        textDirection: widget.lang == "ar"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: cairo),
                    onTap: () {



                      _webController.loadUrl(shopUrl);
                    },
                  ),
                  const Divider(
                      height: 10, thickness: 1, color: Color(0x5E008E33)),
                  ListTile(
                    selected: true,

                    iconColor:Colors.white ,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    selectedColor: Colors.white,
                    selectedTileColor: Colors.white,
                    trailing:const Icon(
                        Icons.phone
                    ),
                    title: Text(contact,
                        textDirection: widget.lang == "ar"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: cairo),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer

                      _webController.loadUrl(contactUrl);
                    },
                  ),
                  const Divider(
                      height: 10, thickness: 1, color: Color(0x5E008E33)),
                  ListTile(
                    selected: true,

                    iconColor:Colors.white ,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    selectedColor: Colors.white,
                    selectedTileColor: Colors.white,
                    trailing:const Icon(
                        Icons.login_outlined
                    ),
                    title: Text(sout,
                        textDirection: widget.lang == "ar"
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: cairo),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const LangView()));
                    },
                  ),
                  const Divider(
                      height: 10, thickness: 1, color: Color(0x5E008E33)),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: InkWell(
                            child: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onTap: () {
                              launch("https://facebook.com/");
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: InkWell(
                            child: const Icon(
                              MyFlutterAppIcon.instagram,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onTap: () {
                              launch("https://instagram.com/");
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: InkWell(
                            child: const Icon(
                              MyFlutterAppIcon.twitter,

                              color: Colors.white,
                              size: 30.0,
                            ),
                            onTap: () {
                              launch("https://twitter.com/");
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: InkWell(
                            child: const Icon(
                              Icons.whatsapp,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onTap: () {
                              launch("https://wa.me/96599974367");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      launch("https://facto-solutions.com/");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Programmed and designed by ",style:TextStyle(fontSize: 8,fontWeight: FontWeight.w300,color:Color(
                            0xCED3D9D5)) ),
                        Text("facto-solutions.com",style:TextStyle(fontSize: 8,fontWeight: FontWeight.w300,color:Color( 0xCE19FF5A) ) ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    WebView(

                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: url,

                      onWebResourceError: (webHasError) {
                        setState(() async {
                          // ignore: unnecessary_null_comparison
                          if (webHasError.errorCode != null) {
                            internetNotConnction = true;
                            _showToast('No internet Connection');
                          } else {
                            internetNotConnction = false;
                          }
                        });
                      },
                      onWebViewCreated: (WebViewController webViewController) {
                        setState(() {
                          _webController = webViewController;
                          _webController.clearCache();

                        });
                      },
                      onPageFinished: (String x){

                        setState(() {
                          loadingApp = false;
                        });
                      }
                      ,
                      onProgress: (int proc) async {
                        if (kDebugMode) {
                          print(proc);
                        }

                        if (proc < 100 && proc > 0) {
                          setState(() {
                            loadingApp = true;
                          });
                        } else if (proc > 90) {
                          setState(() {
                            loadingApp = false;
                          });
                        }

                        if (proc > 0) {
                          await _webController.runJavascript(
                              "document.getElementsByClassName('elementor-location-footer')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('mob-menu-header-holder')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('footer')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('subfooter')[0].style.display='none'");

                          await _webController.runJavascript(
                              "document.getElementsByClassName('hidemob')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('hidemob')[1].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('hidemob')[2].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('mob-menu-slideout-over')[0].style.paddingTop='0px'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('mob-menu-slideout-over')[0].style.paddingTop='0px'");

                          await _webController.runJavascript(
                              "document.getElementsByClassName('hidemob2')[2].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementById('headerar').style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementById('headeren').style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('elementor-location-footer')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementById('footerenup').style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementById('footerensub').style.display='none'");
                        }
                      },
                    ),
                    Visibility(
                      visible: loadingApp,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFFD9D9D9), Color(0xffffffff)],
                                transform: GradientRotation(35.0))),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height -
                                    (80 *
                                            (MediaQuery.of(context)
                                                .size
                                                .height)) /
                                        100,
                              ),
                              Center(child: Image.asset("images/logo.png")),
                              SpinKitFadingCircle(
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: index.isEven
                                          ? Colors.green
                                          : Colors.green,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: internetNotConnction,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFFD9D9D9), Color(0xffffffff)],
                                transform: GradientRotation(35.0))),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height -
                                    (80 *
                                            (MediaQuery.of(context)
                                                .size
                                                .height)) /
                                        100,
                              ),
                              Center(child: Image.asset("images/logo.png")),
                              SpinKitFadingCircle(
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: index.isEven
                                          ? Colors.green
                                          : Colors.green,
                                    ),
                                  );
                                },
                              ),
                              InkWell(
                                  onTap: () async {
                                    _webController.reload();
                                    try {
                                      final result =
                                          await InternetAddress.lookup(
                                              'google.com');
                                      if (result.isNotEmpty &&
                                          result[0].rawAddress.isNotEmpty) {
                                        internetNotConnction=false;
                                      }
                                    } on SocketException catch (_) {
                                      internetNotConnction=true;
                                    }


                                  },
                                  child: Container(
                                      width: 100,
                                      height: 51,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0xFF0E8F38),
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: const Center(
                                          child: Text(
                                        "Reloade",
                                        style: TextStyle(color: Colors.white),
                                      )))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool?> _showToast(String mgs) {
  return Fluttertoast.showToast(
      msg: mgs,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
