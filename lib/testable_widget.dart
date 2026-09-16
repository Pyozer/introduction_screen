import 'package:material_ui/material_ui.dart';

Widget testableWidget({required Widget child}) {
  return MaterialApp(
    home: Scaffold(body: child),
  );
}
