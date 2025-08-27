# Changelog

## [3.1.17] - 2025-02-18

- Reduce example app minimum sdk [#226](https://github.com/Pyozer/introduction_screen/pull/226)

## [3.1.16] - 2025-02-12

- Allow skipButton and backButton to be used at the same time [#219](https://github.com/Pyozer/introduction_screen/pull/219)
- Implement backgroundImage for PageViewModel [#214](https://github.com/Pyozer/introduction_screen/pull/214)
- Regenerate example app

## [3.1.15] - 2025-02-12

- Fix button style can not be overridden [#224](https://github.com/Pyozer/introduction_screen/pull/224)
- Enhance Test Coverage for Introduction Screen [#221](https://github.com/Pyozer/introduction_screen/pull/221)

## [3.1.14] - 2024-03-23

### Fixed
- Fix scroll NotificationListener on PageView children [#208](https://github.com/Pyozer/introduction_screen/pull/208)

## [3.1.13] - 2024-03-23

### Added
- Add scrollViewKeyboardDismissBehavior parameter on PageViewModel [#195](https://github.com/Pyozer/introduction_screen/pull/195) [#212](https://github.com/Pyozer/introduction_screen/pull/212)
- Re-generate example app with latest flutter version
- Update dependencies to latest version (flutter_keyboard_visibility to 6.0.0)

### Fixed
- Fix page controller used on autoScroll after introduction disposed [#191](https://github.com/Pyozer/introduction_screen/pull/191) [#196](https://github.com/Pyozer/introduction_screen/pull/196) [#199](https://github.com/Pyozer/introduction_screen/pull/199)

## [3.1.12] - 2023-10-03

### Fixed
- Add option to adjust page margin [PR#194](https://github.com/Pyozer/introduction_screen/pull/194)

## [3.1.11] - 2023-07-13

### Fixed
- Fixes last page detection [PR#193](https://github.com/Pyozer/introduction_screen/pull/193)

## [3.1.10] - 2023-07-11

### Added
- Add getter `getCurrentPage()` to get current page as an integer

### Fixed
- Fixed a bug on auto scroll using raw pages when initial launch [PR#189](https://github.com/Pyozer/introduction_screen/pull/189)
- Revert _currentpage to a double instead of int to have the dots animation

## [3.1.9] - 2023-06-19

### Changed
- Some changes and fixes to auto scroll [PR#186](https://github.com/Pyozer/introduction_screen/pull/186)

### Added
- [collection](https://pub.dev/packages/collection) dependency for above

### Fixed
- Fix auto scroll error [PR#177](https://github.com/Pyozer/introduction_screen/pull/177)
- Fix breaking -> turn _currentpage into an int instead of double [PR#180](https://github.com/Pyozer/introduction_screen/pull/180)
- Fix PageController.page cannot be accessed before a PageView is built with it [PR#178](https://github.com/Pyozer/introduction_screen/pull/178)

## [3.1.8] - 2023-04-19
- Added safeAreaList parameter [PR#174](https://github.com/Pyozer/introduction_screen/pull/174)

## [3.1.7] - 2023-03-16
- Added hideBottomOnKeyboard parameter [PR#171](https://github.com/Pyozer/introduction_screen/pull/171)

## [3.1.6] - 2023-02-15
- Added customProgress parameter [PR#167](https://github.com/Pyozer/introduction_screen/pull/167)

## [3.1.5] - 2023-02-15

### Added
- Added the option conceal the bottom part of the introduction screen [PR#163](https://github.com/Pyozer/introduction_screen/pull/163) 
- Adding the getCurrentPageNumber getter [PR#164](https://github.com/Pyozer/introduction_screen/pull/164)

## [3.1.4] - 2023-01-13

### Fixed
-  Fix bounce effect that occurs after last page - [PR#159](https://github.com/Pyozer/introduction_screen/pull/159)

### Changed
- changed footer to flexible + footerFit + readme - [PR#160](https://github.com/Pyozer/introduction_screen/pull/160)

## [3.1.3] - 2023-01-11

### Added
- Added a README section demoing IntroductionScreen key param - [PR#154](https://github.com/Pyozer/introduction_screen/pull/154)
- Added dynamic safeArea - [PR#158](https://github.com/Pyozer/introduction_screen/pull/158)

### Fixed
-  fix sample visual - [PR#158](https://github.com/Pyozer/introduction_screen/pull/158)

### Changed
- remove footer from body - [PR#157](https://github.com/Pyozer/introduction_screen/pull/157)

## [3.1.2] - 2022-12-28

### Added
- `unfocus` in both next and previous methods - [PR#153](https://github.com/Pyozer/introduction_screen/pull/153) 
-  body padding option - [PR#143](https://github.com/Pyozer/introduction_screen/pull/143) 
- `allowImplicitScrolling` parameter to IntroductionScreen widget - [PR#138](https://github.com/Pyozer/introduction_screen/pull/138) 

## [3.1.1] - 2022-11-29

### Fixed 
- Explicitly select `elementAtOrNull` from our `CustomList` helper by using an extension override. [#151](https://github.com/Pyozer/introduction_screen/issues/151)

## [3.1.0] - 2022-11-26

### Added
- `resizeToAvoidBottomInset` to for better keyboard support - [PR#141](https://github.com/Pyozer/introduction_screen/pull/141)
- `canProgress` parameter to check if it is valid to progress to the next page - [PR#137](https://github.com/Pyozer/introduction_screen/pull/137)
- autoscroll method - [PR#136](https://github.com/Pyozer/introduction_screen/pull/136)

### Fixed 
- Hiding Of Skip Button Is Now Handled By A Visibility Widget So It Doesn't Jump Around - [PR#127](https://github.com/Pyozer/introduction_screen/pull/127)

### Changed 
- README.md improvements - [PR#120](https://github.com/Pyozer/introduction_screen/pull/120)
- Update Gradle and Kotlin versions in example app - [PR#145](https://github.com/Pyozer/introduction_screen/pull/145)
- Fix deprecated warnings in example app


## [3.0.2] - 2022-03-30

* Downgrade collection lib to 1.15.0 ([IS#113](https://github.com/Pyozer/introduction_screen/issues/113))

## 3.0.1

* Fix missing Position export (Thanks to [PR#111](https://github.com/Pyozer/introduction_screen/pull/111))
* Fix semantics to avoid double button (Thanks to [PR#110](https://github.com/Pyozer/introduction_screen/pull/110))
* Allow params to be updated (**Can be a breaking change** Thanks to [PR#108](https://github.com/Pyozer/introduction_screen/pull/108))
* Set button type for semantics (Thanks to [PR#107](https://github.com/Pyozer/introduction_screen/pull/107))

## 3.0.0

**SOME BREAKING CHANGE, please check your code and UI render**
* Add back button (Thanks to [PR#90](https://github.com/Pyozer/introduction_screen/pull/90))
* Add buttons parameters to override pre-built buttons
* Add `controlsPosition` parameter
* Add semantic labels parameters for buttons (Thanks to [PR#80](https://github.com/Pyozer/introduction_screen/pull/80))
* Replace buttons color parameters by styles (Thanks to [PR#101](https://github.com/Pyozer/introduction_screen/pull/101))
* Add option to put image next to content in landscape (Thanks to [PR#74](https://github.com/Pyozer/introduction_screen/pull/74))
* Allow body widget to be built without padding (Thanks to [PR#73](https://github.com/Pyozer/introduction_screen/pull/73))
* Replace single scrollController parameter by a list (Thanks to [PR#71](https://github.com/Pyozer/introduction_screen/pull/71))

## 2.1.0

* **Some UI changes has been made, please check your app to be sure nothing has been changed**
* Support fullscreen images (Thanks to [PR#29](https://github.com/Pyozer/introduction_screen/pull/29))
* Support reverse page coontent order (Thanks to [PR#32](https://github.com/Pyozer/introduction_screen/pull/32))
* Support custom buttons colors (Thanks to [PR#34](https://github.com/Pyozer/introduction_screen/pull/34))
* Support raw pages (Widget) (Thanks to [PR#42](https://github.com/Pyozer/introduction_screen/pull/42))
* Add showDoneButton property (Thanks to [PR#45](https://github.com/Pyozer/introduction_screen/pull/45))
* Add scrollController property for pages scroll views (Thanks to [PR#58](https://github.com/Pyozer/introduction_screen/pull/58))
* Add globalFooter and globalHeader property (Thanks to [PR#61](https://github.com/Pyozer/introduction_screen/pull/61))
* Other new properties for customizations has been added, see README for more info
  * Like RTL, paddings, margins, ..

## 2.0.0

* Add null safety support (Thanks to [PR#60](https://github.com/Pyozer/introduction_screen/pull/60))

## 1.0.9

* You can now access to `next` function
* Add mounted check before setState ([PR#24](https://github.com/Pyozer/introduction_screen/pull/24))
* You can now press the dots indicators to change the page (can be disabled)

## 1.0.8

* You can now access to IntroductionScreenState (for controller, animateScroll or skipToEnd functions)
* Add public function to go to last page (skip to end)
* Fix PageMetric type issue

## 1.0.7

* __Breaking changes :__ `dotsDecoration` is now for all pages
* Add new parameters to handle paddings (image, title, body, ..)
* Using latest dots_indicator package to support "animate" dots
* Improve example app and update demo gifs on Readme

## 1.0.6

* __Breaking changes :__ `title` and `body` are now named parameters
* You can now add `titleWidget` to have a title as Widget instead of String
* You can now add `bodyWidget` to have a body as Widget instead of String

## 1.0.5+2

* Fix next button disable

## 1.0.5+1

* Improve example code
* Fix README mistake

## 1.0.5

* Add `globalBackgroundColor` property to define background color for all transparent pages
* Add `showNextButton` property to set Next button visible or not

## 1.0.4

* Add possibility to define flex ratio for skip, dots and next/done button.

## 1.0.3+1

* Update dots_indicator library to `0.0.5+1`

## 1.0.3

* __Breaking changes :__ Update `dots_indicator` library, now you must/can provide dots customizations with `DotsDecorator` model with `dotsDecorator` property of `PageDecoration`.

## 1.0.2

* __Breaking changes :__ All page customization has been moved to **PageDecoration** model
* Improve layout of the page
* Add `imageFlex` and `bodyFlex` parameter on **PageDecoration**, to custom flex ratio
* Improve example app

## 1.0.1

* Add scrollview on page content to handle small screen
  
## 1.0.0

* __Breaking changes :__ `image` (Widget) parameter is now optional
* Add possibility to provide `BoxDecoration` (Thanks to [https://github.com/MohiuddinM](https://github.com/MohiuddinM))
* Add possibility to override default onSkip method

## 0.0.5

* __Breaking changes :__ `done` (Widget) parameter is now required
* __Breaking changes :__ `skip` (Widget) parameter is now required if you set `showSkipButton: true`
* Fix bug
* Add onChange listener
* Add possibility to add a footer (like a button)
* Add animation duration
* Add possibility to define the initial page
* Add possibility to freeze the scroll

## 0.0.4

* Improve customization
* Change String type to Widget for buttons, to set an Icon for example
* Remove __nextText__ parameter, __use next instead__
* Remove __doneText__ parameter, __use done instead__
* Remove __skipText__ parameter, __use skip instead__
  
## 0.0.3

* Fix design padding layout on small device
* Improve layout Expanded flex
  
## 0.0.2

* Published on Pub
* Fix bugs

## 0.0.1

* First version
