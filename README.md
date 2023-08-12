# LBDigit
LBDigit provides a Digit written in Swift and SwiftUI. 

![Demo](https://github.com/andylindebros/LBDigit/blob/main/Docs/animation.gif)


## How to use.

### Install the Swift package
1. In Xcode, with your app project open, navigate to File > Add Packages.
2. When prompted, add LBDigit 
```
https://github.com/andylindebros/LBDigit.git
```
3. Select the version that you want to use
4. Select the library.

### How to use it
Add the Digit to your view.
```Swift
import LBDigit

struct ContentView: View {
    var body: some View {
        Digit(
            value: 1, // Represents the number that should be presented as a digit
            thickness: 10, // The thickness of the arms, Default is 10.
            distance: 1, // The distance between the arms. Default is 1
            color: Color.gray, // The color of the arms
            highligtedColor: Color.red, // the highlighted color of the arms
            applyHighlightedShaddow: true // Apply shadows to the hightlighted arms. Default is true
        )
    }
}
```

### Available states:
- 0 - 9
- 10 represents a dash sign `-`
- 11 represents `e` as in error
- 12 represents no number

This Swift package provides an example of how `LBDigit` can be used. Open the `LBDigitExample` in Xcode to find out more how it works.
