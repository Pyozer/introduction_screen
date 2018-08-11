# introduction_screen

Introduction screen allow you to have a screen at launcher for example, where you can explain your app.
This Widget is customizable (more in the future) with a great design.

Introduction_screen is use another package, [dots_indicator](https://github.com/Pyozer/dots_indicator), that I also created.

# Installation

You just need to add `introduction_screen` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

This package is not upload to Pub yet.
So you need to add it from Git repository:
```yaml
dependencies:
  dots_indicator:
    git: git://github.com/pyozer/introduction_screen
```

# Example

In these example, `pageLength` is the total of dots to display and `currentIndexPage` is the position to hightlight (the active dot).

### A intro screen

Simple intro screen

![Base intro](https://raw.githubusercontent.com/Pyozer/introduction_screen/master/demo/normal.gif)

```dart
new IntroScreen(
      pages: listPagesViewModel,
      onDone: () {
        // When done button is press
      }
    ); //Material App
```

### With skip button

![With skip button](https://raw.githubusercontent.com/Pyozer/introduction_screen/master/demo/skip.gif)

```dart
new IntroScreen(
      pages: listPagesViewModel,
      onDone: () {
        // When done button is press
      },
      showSkipButton: true
    ); 
```

### Change button text

![Custom button text](https://raw.githubusercontent.com/Pyozer/introduction_screen/master/demo/buttons.gif)

```dart
new IntroScreen(
      pages: listPagesViewModel,
      onDone: () {
        // When done button is press
      },
      showSkipButton: true,
      skipText: "Go to last",
      nextText: "Next slide",
      doneText: "Done"
    ); 
```
