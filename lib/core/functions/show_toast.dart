import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({
  required String? message,
  required ToastStates state,
  ToastGravity gravity = ToastGravity.BOTTOM,
}) {
  return Fluttertoast.showToast(
    msg: message!,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    timeInSecForIosWeb: 1,

    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
