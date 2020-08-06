import 'package:flutter/material.dart';

final kInputDecoration = BoxDecoration(
  color: Color(0xFF26A69A),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black38.withOpacity(0.1),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ],
);
