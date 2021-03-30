# IntroductionScreen [![pub package](https://img.shields.io/pub/v/introduction_screen.svg)](https://pub.dartlang.org/packages/introduction_screen)

Introduction screen allow you to have a screen at launcher for example, where you can explain your app.
This Widget is very customizable with a great design.

Introduction_screen use another package, [dots_indicator](https://github.com/Pyozer/dots_indicator), that I also created.

<img src="https://raw.githubusercontent.com/Pyozer/introduction_screen/master/demo/example.gif" width="270">

## Installation

You just need to add `introduction_screen` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

```yaml
dependencies:
  introduction_screen: ^2.1.0
```

## Example

Many parameters are available, in next section of example all are not listed. To see all parameters available please check end of README.
If you want to display IntroductionScreen only once (e.g: first start of your app), use SharedPreferences (or similar) to save status (already display or not). It's not responsability of this package ot handle this.


In these example, `listPagesViewModel` is the **list of pages**. A page is base on `PageViewModel`. See example of a `PageViewModel` below.

## PageViewModel

### Simple page

This example only define title, body and an image (you can define any widget)

```dart
PageViewModel(
  title: "Title of first page",
  body: "Here you can write the description of the page, to explain someting...",
  image: Center(
    child: Image.network("https://domaine.com/image.png", height: 175.0),
  ),
)
```

### Page with custom colors

This example show you how to define the color of the page

```dart
PageViewModel(
  title: "Title of first page",
  body: "Here you can write the description of the page, to explain someting...",
  image: Center(child: Image.asset("res/images/logo.png", height: 175.0)),
  decoration: const PageDecoration(
    pageColor: Colors.blue,
  ),
)
```

### Page with custom text style

This example show you how to define another TextStyle for the title and the body

```dart
PageViewModel(
  title: "Title of first page",
  body: "Here you can write the description of the page, to explain someting...",
  image: const Center(child: Icon(Icons.android)),
  decoration: const PageDecoration(
    titleTextStyle: TextStyle(color: Colors.orange),
    bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
  ),
)
```

### Page with a footer, like a button

This example show you how to define a page with a footer, like a Button

```dart
PageViewModel(
  title: "Title of first page",
  body: "Here you can write the description of the page, to explain someting...",
  image: const Center(child: Icon(Icons.android)),
  footer: ElevatedButton(
    onPressed: () {
      // On button presed
    },
    child: const Text("Let's Go !"),
  ),
);
```

### Page with widget body

This example show you how to define a page with a body as Widget and not a simple String
You can to the same this for title, with `titleWidget` parameter.

```dart
PageViewModel(
  title: "Title of first page",
  bodyWidget: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text("Click on "),
      Icon(Icons.edit),
      Text(" to edit a post"),
    ],
  ),
  image: const Center(child: Icon(Icons.android)),
);
```

## IntroductionScreen

**Note :**

If you not provide `next` parameter, the Next button will be not displayed.
If you want to display a skip button, you must add `skip` parameter and `showSkipButton: true`.

The `done` parameter is required only if `showDoneButton: true`.

### Simple intro screen

Simple intro screen

```dart
IntroductionScreen(
  pages: listPagesViewModel,
  done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
  onDone: () {
    // When done button is press
  },
); //Material App
```

### Intro screen with skip button

```dart
IntroductionScreen(
  pages: listPagesViewModel,
  onDone: () {
    // When done button is press
  },
  showSkipButton: true,
  skip: const Text("Skip"),
  done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
);
```

### Intro screen with custom button text and dots indicators

```dart
IntroductionScreen(
  pages: listPagesViewModel,
  onDone: () {
    // When done button is press
  },
  onSkip: () {
    // You can also override onSkip callback
  },
  showSkipButton: true,
  skip: const Icon(Icons.skip_next),
  next: const Icon(Icons.next),
  done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
  dotsDecorator: DotsDecorator(
    size: const Size.square(10.0),
    activeSize: const Size(20.0, 10.0),
    activeColor: theme.accentColor,
    color: Colors.black26,
    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0)
    )
  ),
);
```

### Intro screen with custom button colors

When one of the colors such as `skipColor` is defined, `color` will be ignored.

```dart
IntroductionScreen(
  pages: listPagesViewModel,
  done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
  color: Colors.orange,  
  skipColor: Colors.red,  
  doneColor: Colors.green,  
  nextColor: Colors.blue,
  onDone: () {
    // When done button is press
  },
); 
```

### Parameters of IntroductioonScreen widget

Many parameters can be used to customized Intro like you want !
This is all parameters you can add :

- Page that will be display (`PageViewModel`), by adding `pages: [..]` parameter.
- Use your own pages (Widget) without using those predefined, by adding `rawPages: [..]` parameter.
  - If you provide both `rawPages` and `pages` parameter, `pages` will be used.
- Set a custom callback when done button is pressed, by adding `onDone: () {}` parameter.
  - This param is required, except if you set `showDoneButton: false`
- Define Done button (Widget), by adding `done: Text('Done')`
  - This param is required, except if you set `showDoneButton: false`
- Set a custom callback when skip button is pressed, by adding `onSkip: () {}` parameter.
  - By default, it will go to the last page
- Add callback to listen page changes, by adding `onChange: (page) {}` parameter.
- Define Skip button (Widget), by adding `skip: Text('Skip')`
  - This param is required if you set `showSkipButton: true`
- Define Next button (Widget), by adding `next: Text('Next')`
  - This param is required, except if you set `showNextButton: false`
- Hide/show Skip button, by adding `showSkipButton: false` parameter. (Default `false`)
- Hide/show Next button, by adding `showNextButton: false` parameter. (Default `true`)
- Hide/show Done button, by adding `showDoneButton: false` parameter. (Default `true`)
- Display or not the progress dots, by adding `isProgress: false` parameter. (Default `true`)
- Enable or disable dots progress tap, by adding `isProgressTap: false` parameter. (Default `true`)
- Freeze the scroll, by adding `freeze: true` parameter. (Default `false`)
- Global background color, by adding `globalBackgroundColor: Colors.blue` parameter.
  - Tips: use `Colors.transparent` to display an image as background (using Stack with IntroductionScreen inside for example)
- Customize dots (progression) by adding `dotsDecorator: DotsDecorator(...)`
  - You can customize dots size, shape, colors, spacing.
- Customize dots container by adding `dotsContainerDecorator: BoxDecorator(...)`
  - You can customize container that contain controls.
- Duration of scrolling animation, by adding `animationDuration: 400` parameter. (Default `350`)
- Initial page, by adding `initialPage: 2` parameter. (Default `0`)
- Skip button flex, by adding `skipFlex: 1` parameter. (Set 0 to disable Expanded behaviour, default `1`)
- Dots indicator flex, by adding `dotsFlex: 1` parameter. (Set 0 to disable Expanded behaviour, default `1`)
- Next/Done button flex, by adding `nextFlex: 1` parameter. (Set 0 to disable Expanded behaviour, default `1`)
- Animation curve between pages, by adding `curve: Curves.elasticIn` parameter. (Default `Curves.easeIn`)
- Change global color of buttons (skip, next, done), by adding `color: Colors.yellow` parameter.
- Change skip button color, by adding `skipColor: Colors.red` parameter.
- Change next button color, by adding `nextColor: Colors.green` parameter.
- Change done button color, by adding `doneColor: Colors.blue` parameter.
- Enable or disable SafeArea on top, by adding `isTopSafeArea: true` parameter (Default `false`).
- Enable or disable SafeArea on bottom, by adding `isBottomSafeArea: true` parameter. (Default `false`)
- Customize margin of controls's container, by adding `controlsMargin: EdgeInsets.all(16.0)` parameter. (Default `EdgeInsets.zero`)
- Customize padding of controls's container, by adding `controlsPadding: EdgeInsets.all(8.0)` parameter. (Default `EdgeInsets.all(16.0`)
- Add global header (top), static and displayed above pages, by adding `globalHeader: Image.asset(...)` parameter.
- Add global footer below controls/dots, by adding `globalFooter: ElevatedButton(...)` parameter.
- Provide a scrollController for scrollView inside pages, by adding `scrollController` parameter.
  - Will be ignored for page(s) if `useScrollView` is set to false in PageViewModel(s)
- Change axis of scroll by adding `pagesAxis: Axis.vertical`. (Default `Axis.horizontal`)
- Change default scroll physics of PageView by adding `scrollPhysics: ClampingScrollPhysics()`. (Default `BouncingScrollPhysics()`)
- You can also enable right-to-left behavious by adding `rtl: true`. (Default `false`)

### Parameters of PageViewModel (each pages)

You can also provide many parameter to customize each pages :

- `title: "Title of the page"` or `titleWidget: Text("Custom widget for title")`
- `body: "Body of the page"` or `bodyWidget: Text("Custom widget for body")`
- `image: Image.asset(...)` image of the page.
  - It's expecting a Widget, so if you want to pass a Video, Text, or anything else, you can.
- `footer: ElevatedButton(...)`, display a widget below body
  - Like image param, it's expecting a Widget, you can pass what you want.
- `decoration: PageDecoration(...)`, page decoration to customize page
  - See next section for all parameters you can pass
- `reverse: true`, reverse order of image and content (title/body). (Default: `false`)
- `useScrollView: false`, by default pages use a Scrollview to handle small screen or long body text. You can remove ScrollView by setting to false.

### Parameters of PageDecoration (decoration of a page)

- `pageColor: Colors.white`, background color of the page
  - You cannot use both pageColor and boxDecoration params
- `titleTextStyle: TextStyle(...)`, TextStyle of the title
- `bodyTextStyle: TextStyle(...)`, TextStyle of the body
- `boxDecoration: BoxDecoration(...)`, BoxDecoration of page container
  - You cannot use both pageColor and boxDecoration params
- `imageFlex: 2`, flex ratio of the image
- `bodyFlex: 3`, flex ratio of the content (title/body)
- `imagePadding: EdgeInsets.only(bottom: 12.0)`, padding of the image Widget. (Default `EdgeInsets.only(bottom: 24.0)`)
- `contentPadding: EdgeInsets.only(all: 24.0)`, padding of the content (title/body/footer) Widget. (Default `EdgeInsets.all(16)`)
- `titlePadding: EdgeInsets.only(bottom: 24.0)`, padding of the title text/Widget. (Default `EdgeInsets.only(top: 16.0, bottom: 24.0)`)
- `descriptionPadding: EdgeInsets.only(bottom: 24.0)`, padding of the body text/Widget. (Default `EdgeInsets.zero`)
- `footerPadding: EdgeInsets.only(top: 24.0)`, padding of the footer text/Widget. (Default `EdgeInsets.symmetric(vertical: 24.0)`)
- `bodyAlignment: Align.center`, content (title, body, footer) alignment. (Default `Align.topCenter`)
- `imageAlignment: Align.center`, image alignment. (Default `Align.bottomCenter`)
- `fullScreen: true`, Set image as fullscreen (background). (Default `false`)