import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/model/page_view_model.dart';

const kImageDemo =
    "https://freeiconshop.com/wp-content/uploads/edd/bulb-curvy-flat.png";

void main() => runApp(App());

class App extends StatelessWidget {
  final pages = [
    PageViewModel(
      "First title page",
      "Text of the first page",
      image: Center(child: Image.network(kImageDemo, height: 175.0)),
    ),
    PageViewModel(
      "Second title page",
      "Text of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button\nText of the second page, with a button",
      image: Center(child: Image.network(kImageDemo, height: 175.0)),
      footer: RaisedButton(
        onPressed: () {/* Nothing */},
        child: const Text('Button', style: TextStyle(color: Colors.white)),
        color: Colors.lightBlue,
      ),
    ),
    PageViewModel(
      "Third title page",
      "Text of the third page",
      image: Center(child: Image.network(kImageDemo, height: 175.0)),
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(fontSize: 22.0),
      progressColor: Colors.red,
      progressSize: Size.fromRadius(8),
    ),
  ];

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IntroductionScreen(
        pages: pages,
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        showSkipButton: true,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
