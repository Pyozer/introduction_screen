import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/model/page_decoration.dart';
import 'package:introduction_screen/model/page_view_model.dart';

const kImageDemo =
    "https://cdn4.iconfinder.com/data/icons/onboarding-material-color/128/__14-512.png";

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key key}) : super(key: key);

  List<PageViewModel> _buildPages() => [
        PageViewModel(
          "Affluences",
          "Text of the first page of this onboarding",
          image: Align(
            child: Image.network(kImageDemo, height: 175.0),
            alignment: Alignment.bottomCenter,
          ),
        ),
        PageViewModel(
          "Second title page",
          "Text of the second page of this onboarding",
          image: Align(
            child: Image.network(kImageDemo, height: 175.0),
            alignment: Alignment.bottomCenter,
          ),
          footer: RaisedButton(
            onPressed: () {/* Nothing */},
            child: const Text('Button', style: TextStyle(color: Colors.white)),
            color: Colors.lightBlue,
          ),
        ),
        PageViewModel(
          "Third title page",
          "Text of the third page of this onboarding",
          image: Align(
            child: Image.network(kImageDemo, height: 175.0),
            alignment: Alignment.bottomCenter,
          ),
          decoration: PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
            bodyTextStyle: TextStyle(fontSize: 22.0),
            progressColor: Colors.red,
            progressSize: Size.fromRadius(8),
          ),
        ),
      ];

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: _buildPages(),
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
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
