
# CEMKit

UIKit toolset for quick prototyping and rapid development

## Table of Contents

* [Installation](#Installation)
* [UIView](#UIView)
	* [Init](#UIView-Init)
	* [Frame](#UIView-Frame)
	* [Layer](#UIView-Layer)
	* [Transform](#UIView-Transform)
	* [Animation](#UIView-Animation)
	* [Rendering](#UIView-Rendering)
	* [Gestures](#UIView-Gestures)
* [UIViewController](#UIViewController)
* [UIImageView](#UIImageView)
* [UILabel](#UILabel)
	* [NSAttributedString](#UILabel-NSAttributedString)
	* [Frame](#UILabel-Frame)
* [UIFont](#UIFont)
* [UIColor](#UIColor)
* [UIImage](#UIImage)
* [String](#String)
* [CGPoint](#Globals)
* [CGSize](#CGSize)
* [CGPoint](#CGPoint)
* [CGFloat](#CGFloat)
* [UIAlertController](#UIAlertController)
* [UIBarButtonItem](#UIBarButtonItem)
* [BlockButton](#BlockButton)
* [BlockWebView](#BlockWebView)
* [BlockTap](#BlockTap)
* [BlockPan](#BlockPan)
* [BlockSwipe](#BlockSwipe)
* [BlockPinch](#BlockPinch)
* [BlockLongPress](#BlockLongPress)
* [BlockPicker](#BlockPicker)
* [BlockBadge](#BlockBadge)
* [BlockPicker](#BlockPicker)
* [DequeuableScrollView](#DequeuableScrollView)


## Installation

#### Manual
Copy & Paste CEMKit.swift into your project

#### Cocoapods

	pod "CEMKit-Swift", "~> 0.1.3"


## Documentation

### UIView extension <a id="UIView"></a>

#### Init <a id="UIView-Init"></a>

##### Quick init method for views

``` swift
    convenience init (x: CGFloat,
        y: CGFloat,
        w: CGFloat,
        h: CGFloat)
```


#### Frame <a id="UIView-Frame"></a>

##### Quick access and manupliate to CGRect values of UIView's frame  

``` swift
    var x: CGFloat {
        get {
            return self.frame.origin.x
        } set (value) {
            self.frame = CGRect (x: value, y: self.y, width: self.w, height: self.h)
        }
    }
```

``` swift
    var y: CGFloat {
        get {
            return self.frame.origin.y
        } set (value) {
            self.frame = CGRect (x: self.x, y: value, width: self.w, height: self.h)
        }
    }
```

``` swift
    var w: CGFloat {
        get {
            return self.frame.size.width
        } set (value) {
            self.frame = CGRect (x: self.x, y: self.y, width: value, height: self.h)
        }
    }
```

``` swift
    var h: CGFloat {
        get {
            return self.frame.size.height
        } set (value) {
            self.frame = CGRect (x: self.x, y: self.y, width: self.w, height: value)
        }
    }
```

``` swift
    var position: CGPoint {
        get {
            return self.frame.origin
        } set (value) {
            self.frame = CGRect (origin: value, size: self.frame.size)
        }
    }
```

``` swift
    var size: CGSize {
        get {
            return self.frame.size
        } set (value) {
            self.frame = CGRect (origin: self.frame.origin, size: size)
        }
    }
```

##### Also for autolayout

``` swift
    var left: CGFloat {
        get {
            return self.x
        } set (value) {
            self.x = value
        }
    }
```

``` swift
    var right: CGFloat {
        get {
            return self.x + self.w
        } set (value) {
            self.x = value - self.w
        }
    }
```

``` swift
    var top: CGFloat {
        get {
            return self.y
        } set (value) {
            self.y = value
        }
    }
```

``` swift
    var bottom: CGFloat {
        get {
            return self.y + self.h
        } set (value) {
            self.y = value - self.h
        }
    }
```

##### Getting frame values with offset

``` swift
	func leftWithOffset (offset: CGFloat) -> CGFloat
	func rightWithOffset (offset: CGFloat) -> CGFloat
	func topWithOffset (offset: CGFloat) -> CGFloat
	func botttomWithOffset (offset: CGFloat) -> CGFloat
```

#### Layer <a id="UIView-Layer"></a>

##### Setting anchor position easily

``` swift
	enum AnchorPosition: CGPoint {
	    case TopLeft        = "{0, 0}"
	    case TopCenter      = "{0.5, 0}"
	    case TopRight       = "{1, 0}"
	    
	    case MidLeft        = "{0, 0.5}"
	    case MidCenter      = "{0.5, 0.5}"
	    case MidRight       = "{1, 0.5}"
	    
	    case BottomLeft     = "{0, 1}"
	    case BottomCenter   = "{0.5, 1}"
	    case BottomRight    = "{1, 1}"
	}
```

``` swift
    func setAnchorPosition (anchorPosition: AnchorPosition)
``` 

##### Shadow, Border, Corner Radius, Stroke, Circle

Adding shadow

``` swift
    func addShadow (offset: CGSize,
        radius: CGFloat,
        color: UIColor,
        opacity: Float)
```

Adding borders

``` swift
    func addBorder (width: CGFloat,
        color: UIColor)
```

Setting corner radius of borders

``` swift
    func setCornerRadius (radius: CGFloat)
```

Adding stroke to borders

``` swift
    func drawStroke (width: CGFloat,
        color: UIColor)
```

Circle Drawing

``` swift
    func drawCircle (fillColor: UIColor,
        strokeColor: UIColor,
        strokeWidth: CGFloat)
```

Arc Drawing

``` swift
    func drawArc (from: CGFloat,
        to: CGFloat,
        clockwise: Bool,
        width: CGFloat,
        fillColor: UIColor,
        strokeColor: UIColor,
        lineCap: String)
```

#### Transform <a id="UIView-Transform"></a>

##### Manuplating view's rotation and scale

Rotation

``` swift
	func setRotationX (x: CGFloat)
	func setRotationY (y: CGFloat)
	func setRotationZ (z: CGFloat)
    
   func setRotation (x: CGFloat,
   		y: CGFloat,
   		z: CGFloat)
```

Scale

``` swift
    func setScale (x: CGFloat,
        y: CGFloat)
```


#### Animation <a id="UIView-Animation"></a>

##### Animating view with constant values

Constants

``` swift
	let UIViewAnimationDuration: NSTimeInterval = 1
	let UIViewAnimationSpringDamping: CGFloat = 0.5
	let UIViewAnimationSpringVelocity: CGFloat = 0.5
``` 

Animation Mehtods

``` swift
    func animate (animations: (()->Void)!,
        completion: ((Bool)->Void)? = nil) 
        
    func spring (animations: (()->Void)!,
        completion: ((Bool)->Void)? = nil)
```

#### Rendering <a id="UIView-Rendering"></a>

Get UIImage form view

``` swift
	func toImage () -> UIImage
```

#### Gestures <a id="UIView-Gestures"></a>

#### Adding gestures single line

Tap 

``` swift
    func addTapGesture (tapNumber: NSInteger,
        target: AnyObject, action: Selector)
```

``` swift
	func addTapGesture (tapNumber: Int,
	        action: ((UITapGestureRecognizer)->())?)
```

Swipe

``` swift
    func addSwipeGesture (
    	direction: UISwipeGestureRecognizerDirection,  
        numberOfTouches: Int,  
        target: AnyObject,  
        action: Selector)  
```

``` swift
	func addSwipeGesture (direction: UISwipeGestureRecognizerDirection,
	        numberOfTouches: Int,
	        action: ((UISwipeGestureRecognizer)->())?)
```

Pan

``` swift
    func addPanGesture (target: AnyObject,
        action: Selector)
```

``` swift
	func addPanGesture (action: ((UIPanGestureRecognizer)->())?)
```

Pinch


``` swift
	func addPinchGesture (target: AnyObject,
	        action: Selector)
```

``` swift
	func addPinchGesture (action: ((UIPinchGestureRecognizer)->())?)
```

Long Press

``` swift
	func addLongPressGesture (target: AnyObject,
	        action: Selector)
```

``` swift
	func addLongPressGesture (action: ((UILongPressGestureRecognizer)->())?)
```


### UIViewController extension <a id="UIViewController"></a>

#### Quick access top layout and bottom layout

Top

``` swift
    var top: CGFloat {
        get {
            if let nav = self.navigationController {
                if nav.navigationBarHidden {
                    return view.top
                } else {
                    return nav.navigationBar.bottom
                }
            } else {
                return view.top
            }
        }
    }
```

Bottom

``` swift
    var bottom: CGFloat {
        get {
            if let tab = tabBarController {
                if tab.tabBar.hidden {
                    return view.bottom
                } else {
                    return tab.tabBar.top
                }
            } else {
                return view.bottom
            }
        }
    }
```
#### Calculate app area exluding NavigationBar and TabBar


``` swift
    var applicationFrame: CGRect {
        get {
            return CGRect (x: view.x, y: top, width: view.w, height: bottom - top)
        }
    }
```

#### Quick access tab bar properties
  
``` swift
    var tabBarHeight: CGFloat {
        get {
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            
            return 0
        }
    }
```
  
#### Quick access navigation bar properties

``` swift
	 var navBar: UINavigationBar? {
        get {
            return navigationController?.navigationBar
        }
    }
```

Get Navigation bar height of device

``` swift
    var navigationBarHeight: CGFloat {
        get {
            if let nav = self.navigationController {
                return nav.navigationBar.h
            }
            
            return 0
        }
    }
```

Get or set navigation bar color

``` swift
    var navigationBarColor: UIColor? {
        get {
            return navigationController?.navigationBar.tintColor
        } set (value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }
```

### UIScrollView <a id="UIScrollView"></a>

#### Content Size

``` swift
    var contentHeight: CGFloat {
        get {
            return contentSize.height
        } set (value) {
            contentSize = CGSize (width: contentSize.width, height: value)
        }
    }
```
  
```swift  
    var contentWidth: CGFloat {
        get {
            return contentSize.height
        } set (value) {
            contentSize = CGSize (width: value, height: contentSize.height)
        }
    }
```
    
#### Content Offset
   
``` swift
    var offsetX: CGFloat {
        get {
            return contentOffset.x
        } set (value) {
            contentOffset = CGPoint (x: value, y: contentOffset.y)
        }
    }
```
  
``` swift
    var offsetY: CGFloat {
        get {
            return contentOffset.y
        } set (value) {
            contentOffset = CGPoint (x: contentOffset.x, y: value)
        }
    }
```
  
### UIImageView <a id="UIImageView"></a>  

#### Init with image

``` swift
    convenience init (frame: CGRect,
        imageName: String)
``` 
  
``` swift
    convenience init (frame: CGRect,
        image: UIImage)
```

#### Init with aspected image

``` swift
    convenience init (x: CGFloat,
        y: CGFloat,
        width: CGFloat,
        image: UIImage)
```
  
``` swift
	convenience init (x: CGFloat,
	        y: CGFloat,
	        height: CGFloat,
	        image: UIImage)
```
  
### UILabel extension <a id="UILabel"></a>

#### NSAttributedString <a id="UILabel-NSAttributedString"></a>

##### `AttributedStrings` property for accessing, adding or updating attributedText of label


``` swift
	private var UILabelAttributedStringArray: UInt8 = 0
    var attributedStrings: [NSAttributedString]? {
        get {
            return objc_getAssociatedObject(self, &UILabelAttributedStringArray) as? [NSAttributedString]
        } set (value) {
            objc_setAssociatedObject(self, &UILabelAttributedStringArray, value, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }

```

Adding

``` swift
    func addAttributedString (text: String,
        color: UIColor,
        font: UIFont)
    func addAttributedString (attributedString: NSAttributedString)
```

Updating

``` swift
    func updateAttributedStringAtIndex (index: Int,
        attributedString: NSAttributedString)
    func updateAttributedStringAtIndex (index: Int,
        newText: String)
```

#### Frame <a id="UILabel-Frame"></a>

##### Automatically sets its height by the contents

``` swift
    func getEstimatedHeight () -> CGFloat
	 func fitHeight ()	
```
  
### UIFont extension <a id="UIFont"></a>

##### FontType and FontName `enum`s for easily create `UIFont`s

``` swift
	enum FontType: String
	enum FontName: String
	class func Font (name: FontName, type: FontType, size: CGFloat) -> UIFont
```

Even customise it for specific font 

``` swift
    class func HelveticaNeue (type: FontType, size: CGFloat) -> UIFont
```

Print all family of font on single line

``` swift
    class func PrintFontFamily (font: FontName)
```

### UIColor extension <a id="UIColor"></a>

##### Create random color or RGB/A colors easily in range of [0, 255]

``` swift
    class func randomColor () -> UIColor
```

``` swift
    class func RGBColor (r: CGFloat,
        g: CGFloat,
        b: CGFloat) -> UIColor
```

``` swift
    class func RGBAColor (r: CGFloat,
        g: CGFloat,
        b: CGFloat,
        a: CGFloat) -> UIColor
```

### UIImage extension <a id="UIImage"></a>

##### Resize an image with keep it aspect ratio

Calculate possible aspect width for height

``` swift
    func aspectWidthForHeight (height: CGFloat) -> CGFloat
```

Calculate possible aspect height for width


``` swift
	func aspectHeightForWidth (width: CGFloat) -> CGFloat
```

Resize image based on its width (auto calculates height and keeps aspect ratio)


``` swift
    func aspectResizeWithWidth (width: CGFloat) -> UIImage
```

Resize image based on its height (auto calculates width and keeps aspect ratio)

``` swift
    func aspectResizeWithHeight (height: CGFloat) -> UIImage
```
  
### String extension <a id="String"></a>

##### Subscript for accessing characters at index of string

``` swift 
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
```

### Globals <a id="Globals"></a>

##### Access device related mesurements

Orientation

``` swift
	var Orientation: UIInterfaceOrientation {
	    get {
	        return UIApplication.sharedApplication().statusBarOrientation
	    }
	}
```
  
Screen Width

``` swift
	var ScreenWidth: CGFloat {
	    get {
	        if UIInterfaceOrientationIsPortrait(Orientation) {
	            return UIScreen.mainScreen().bounds.size.width
	        } else {
	            return UIScreen.mainScreen().bounds.size.height
	        }
	    }
	}
```

Screen Height

``` swift
	var ScreenHeight: CGFloat {
	    get {
	        if UIInterfaceOrientationIsPortrait(Orientation) {
	            return UIScreen.mainScreen().bounds.size.height
	        } else {
	            return UIScreen.mainScreen().bounds.size.width
	        }
	    }
	}
```
  
Status bar height

``` swift
	var StatusBarHeight: CGFloat {
	    get {
	        return UIApplication.sharedApplication().statusBarFrame.height
	    }
	}
```
  
### CGPoint <a id="CGPoint"></a>

##### Custom operators for `CGPoint`s

``` swift
	func + (left: CGPoint, right: CGPoint) -> CGPoint
	func - (left: CGPoint, right: CGPoint) -> CGPoint
```


##### `StringLiteralConvertable` implementation

``` swift
	public init(stringLiteral value: StringLiteralType)
	public init(extendedGraphemeClusterLiteral value: StringLiteralType)
	public init(unicodeScalarLiteral value: StringLiteralType) {
	        self = CGPointFromString(value)
```

### CGSize <a id="CGSize"></a>

##### Custom operators for `CGSize`s

``` swift
	func + (left: CGSize, right: CGSize) -> CGSize
	func - (left: CGSize, right: CGSize) -> CGSize
```
  
### CGFloat <a id="CGFloat"></a>

##### Convert degrees to radians


``` swift
	func degreesToRadians (angle: CGFloat) -> CGFloat
```

##### Normalize value to [0, 1] or vice verca

Convert [min, max] to [0, 1]

``` swift
	func normalizeValue (value: CGFloat,
	    min: CGFloat,
	    max: CGFloat) -> CGFloat
```

Convert [0, 1] to to [min, max]

``` swift
	func convertNormalizedValue (value: CGFloat,
	    min: CGFloat,
	    max: CGFloat) -> CGFloat
```


### UIAlertViewController <a id="UIAlertViewController"></a>

##### Single line, block based ios 8 alert

``` swift
	func alert (title: String,
	    message: String,
	    cancelAction: ((UIAlertAction!)->Void)? = nil,
	    okAction: ((UIAlertAction!)->Void)? = nil) -> UIAlertController
```


### UIBarButtonItem <a id="UIBarButtonItem"></a>

##### Create bar button item with image, single line

``` swift
	func barButtonItem (imageName: String,
	    size: CGFloat,
	    action: (AnyObject)->())
```

``` swift
	func barButtonItem (imageName: String,
	    action: (AnyObject)->()) -> UIBarButtonItem
```

#### Create bar button item with text and color

``` swift
	func barButtonItem (title: String,
	    color: UIColor,
	    action: (AnyObject)->()) -> UIBarButtonItem
```

### BlockButton <a id="BlockButton"></a>

##### Regular `UIButton` with `actionBlock:` 

``` swift
    var actionBlock: ((sender: BlockButton) -> ())? {
        didSet {
            self.addTarget(self, action: "action:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    func action (sender: BlockButton) {
        actionBlock! (sender: sender)
    }
```

### BlockWebView <a id="BlockWebView"></a>

##### Regular `UIWebView` with block based actions instead of `UIWebViewDelegate`

``` swift
    var didStartLoad: ((NSURLRequest) -> ())?
    var didFinishLoad: ((NSURLRequest) -> ())?
    var didFailLoad: ((NSURLRequest, NSError) -> ())?    
    var shouldStartLoadingRequest: ((NSURLRequest) -> (Bool))?
```

### BlockTap <a id="BlockTap"></a>

##### Regular `UITapGestureRecognizer` with block based action

``` swift
	init (tapCount: Int,
	        fingerCount: Int,
	        action: ((UITapGestureRecognizer)->())?)
```

### BlockPan <a id="BlockPan"></a>

##### Regular `UIPanGestureRecognizer` with block based action

``` swift
	init (action: ((UIPanGestureRecognizer)->())?)
```

### BlockSwipe <a id="BlockSwipe"></a>

##### Regular `UISwipeGestureRecognizer` with block based action

``` swift
	init (direction: UISwipeGestureRecognizerDirection,
	        fingerCount: Int,
	        action: ((UISwipeGestureRecognizer)->())?)
```

### BlockPinch <a id="BlockPinch"></a>

##### Regular `UIPinchGestureRecognizer` with block based action

``` swift
	init (action: ((UIPinchGestureRecognizer)->())?)
```

### BlockLongPress <a id="BlockLongPress"></a>

##### Regular `UILongPressGestureRecognizer` with block based action

``` swift
	init (action: ((UILongPressGestureRecognizer)->())?)
```
 
### DequeuableScrollViwew <a id="DequeuableScrollView"></a>

##### Deques the added subviews.
##### Adds or removes subviews from itself depends on its visible frame

``` swift
	override init (frame: CGRect)
```
