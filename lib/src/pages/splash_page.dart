import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //Hide Status bar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

//Navigation to login screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => LoginPage(),
            transitionsBuilder: (context, animation, animation2, child) =>
                FadeTransition(opacity: animation, child: child),
            transitionDuration: Duration(seconds: 3),
          ),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/fundo.png"), fit: BoxFit.cover)),
      child: Center(
        child: Container(
          child: Image.asset("asset/images/logo_ioasys.png"),
        ),
      ),
    ));
  }
}
