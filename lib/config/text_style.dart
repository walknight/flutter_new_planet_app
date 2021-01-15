import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
  static final smallTextStyle = commonTextStyle.copyWith(fontSize: 9);
  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);
  static final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static final regularTextStyle = baseTextStyle.copyWith(
      color: Color(0xffb6b2df), fontSize: 12, fontWeight: FontWeight.w400);
}
