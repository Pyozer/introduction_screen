# introduction_screen

Introduction screen allow you to have a screen at launcher for example, where you can explain your app.
This Widget is customizable (more in the future) with a great design.

Introduction_screen is use another package, [introduction_screen](https://github.com/Pyozer/introduction_screen), that I also created.

# Installation

You just need to add `introduction_screen` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

This package is not upload to Pub yet.
So you need to add it from Git repository:
```yaml
dependencies:
  introduction_screen:
    git: git://github.com/pyozer/introduction_screen
```

# Example

In these example, `listPagesViewModel` is the lis of pages. A page is base on PageViewModel. See an example below.

**No example yet, WIP**

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
