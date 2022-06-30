import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Colors ---------------------------------------------------------------------

const inkDark = Color(0xff121a33);
const ink = Color(0xff222b47);
const inkBright = Color(0xff3e4969);
const inkBrighter = Color(0xff9497b6);
const inkBrightest = Color(0xffc3c5d8);
const pale = Color(0xffe8eaf8);
const paleGray = Color(0xffebecf5);
const pinkyRed = Color(0x91ff1f3a);
const snow = Color(0xfffafafe);
const cherry = Color(0xffff1f58);
const corpDarker = Color(0xff006a77);
const corpDark = Color(0xff0096a9);
const corp = Color(0xff00cae5);
const corpBright = Color(0xff47f6ff);
const corpBrighter = Color(0xffa8fbff);
const corpBrightest = Color(0xffe3feff);
const appleDarker = Color(0xff009841);
const appleDark = Color(0xff00ce58);
const apple = Color(0xff00e963);
const appleBright = Color(0xff40ff92);
const appleBrighter = Color(0xff98ffc4);
const appleBrightest = Color(0xffdaffea);
const limeDark = Color(0xffbed300);
const lime = Color(0xffe4fd03);
const limeBright = Color(0xfff3ff89);
const lightBlueGrey = Color(0xffcccdda);
const blueyGrey = Color(0xff9497b6);

// Padding --------------------------------------------------------------------

const cardEdgeInset1 = EdgeInsets.all(50);
const drawerPadding1 = EdgeInsets.only(top: 8);
const informationPadding1 = EdgeInsets.all(8);
const userCalcPad1 = EdgeInsets.all(4);
const kPad16 = EdgeInsets.all(16);

// BorderRadius ---------------------------------------------------------------

const avatarRad = BorderRadius.all(Radius.circular(50));
const informationRad = BorderRadius.all(Radius.circular(8));

// Shadows --------------------------------------------------------------------

const cardShadow = [
  BoxShadow(color: Colors.grey, offset: Offset(2, 3), blurRadius: 0.5, spreadRadius: 0.5),
];

// BoxDecoration --------------------------------------------------------------

const informationBoxDeco = BoxDecoration(shape: BoxShape.circle, color: appleBright);

// Typo -----------------------------------------------------------------------

const informationStyle = TextStyle(color: inkDark, fontWeight: FontWeight.bold);

// Input Deco -----------------------------------------------------------------
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: snow),
  border: InputBorder.none,
);

const kTextFieldDeco = InputDecoration(contentPadding: EdgeInsets.all(10), hintText: 'Type your seconds amount here');

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2),
  ),
);

// Text Styles ----------------------------------------------------------------
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

// const headline2 = TextStyle(
//     color: corp,
//     fontSize: 24,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Lexend Deca');
// const headline3 =
//     TextStyle(color: blueyGrey, fontSize: 12, fontFamily: 'Lexend Deca');
// const buttons = TextStyle(
//     color: corp,
//     fontSize: 16,
//     fontWeight: FontWeight.w700,
//     fontStyle: FontStyle.normal,
//     letterSpacing: 1.5,
//     fontFamily: 'Lexend Deca');
