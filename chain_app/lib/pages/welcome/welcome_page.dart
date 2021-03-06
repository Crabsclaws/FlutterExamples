import 'dart:async';

import 'package:chain_app/tools/global.dart';
import 'package:chain_app/tools/routes.dart';
import 'package:chain_app/tools/services/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with WidgetsBindingObserver {
  Timer _timer;

  int _seconds = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds--;
      if (_seconds <= 0) {
        timer.cancel();
        _navigator();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset('images/start1.jpeg', fit: BoxFit.fill,),
        ),
      ),
    );
  }

  _navigator() async {
//    Navigator.of(context).pushReplacementNamed(Routes.)
    var token = Global.token;
    print(token);
    if (token != null && token.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed(Routes.tab);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
