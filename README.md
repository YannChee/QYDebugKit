# QYDebugKit

[![CI Status](https://img.shields.io/travis/YannChee/QYDebugKit.svg?style=flat)](https://travis-ci.org/YannChee/QYDebugKit)
[![Version](https://img.shields.io/cocoapods/v/QYDebugKit.svg?style=flat)](https://cocoapods.org/pods/QYDebugKit)
[![License](https://img.shields.io/cocoapods/l/QYDebugKit.svg?style=flat)](https://cocoapods.org/pods/QYDebugKit)
[![Platform](https://img.shields.io/cocoapods/p/QYDebugKit.svg?style=flat)](https://cocoapods.org/pods/QYDebugKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

QYDebugKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
  pod 'QYDebugKit', :git => "https://github.com/YannChee/QYDebugKit.git", :configurations => ['Debug']
```
## Usage

```
#if DEBUG
#import <QYDebugKit/QYDebugManager.h>
#endif

#if DEBUG
    [QYDebugManager.shareInstance initDenugSDKWithStartingPosition:CGPointMake(0, 300) completion:^{
        NSLog(@"QYDebugManager init Success");
    }];
#endif

```


## Author

YannChee, yannchee@163.com

## License

QYDebugKit is available under the MIT license. See the LICENSE file for more info.
