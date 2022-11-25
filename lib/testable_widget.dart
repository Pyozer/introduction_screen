import 'package:flutter/material.dart';

Widget testableWidget({required Widget child}) {
  return MaterialApp(
    home: Scaffold(body: child),
  );
}
