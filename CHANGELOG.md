# Changelog

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
