import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main/mainPage.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
      ? MaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(),
          ),
          onGenerateRoute: (RouteSettings route) {
            return MaterialPageRoute(
              builder: (BuildContext context) => MainPage(),
              settings: RouteSettings(name: MainPage.route),
            );
          },
        )
      : CupertinoApp(
          theme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              textStyle: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: CupertinoColors.black,
              ),
            ),
          ),
          onGenerateRoute: (RouteSettings route) {
            return MaterialPageRoute(
              builder: (BuildContext context) => MainPage(),
              settings: RouteSettings(name: MainPage.route),
            );
          },
        );
  }
}
