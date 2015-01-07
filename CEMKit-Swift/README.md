
# CEMKit

UIKit toolset for quick prototyping and rapid development

## Table of Contents

* [UIView](#UIView)
	* [Init](#UIView-Init)
	* [Frame](#UIView-Frame)
	* [Layer](#UIView-Layer)
	* [Transform](#UIView-Transform)
	* [Animation](#UIView-Animation)
	* [Gestures](#UIView-Gestures)
* [UIViewController](#UIViewController)
* [UILabel](#UILabel)
	* [NSAttributedString](#UILabel-NSAttributedString)
	* [Frame](#UILabel-Frame)
* [String](#String)
* [UIFont](#UIFont)
* [UIColor](#UIColor)
* [UIImage](#UIImage)
* [CGPoint](#CGPoint)
* [CGSize](#CGSize)
* [CGPoint](#CGPoint)
* [CGFloat](#CGFloat)
* [UIAlertController](#UIAlertController)
* [UIBarButtonItem](#UIBarButtonItem)
* [BlockButton](#BlockButton)
* [BlockWebView](#BlockWebView)
	
	
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


#### Gestures <a id="UIView-Gestures"></a>

#### Adding gestures single line

Tap 

``` swift
    func addTapGesture (tapNumber: NSInteger,
        target: AnyObject, action: Selector)
```

Swipe
``` swift
    func addSwipeGesture (direction: UISwipeGestureRecognizerDirection,
        numberOfTouches: Int,
        target: AnyObject,
        action: Selector)
```

Pan
``` swift
    func addPanGesture (target: AnyObject,
        action: Selector)
```

### UIViewController <a id="UIViewController"></a>


### UILabel <a id="UILabel"></a>

#### NSAttributedString <a id="UILabel-NSAttributedString"></a>

#### Frame <a id="UILabel-Frame"></a>


### String <a id="String"></a>

### UIFont <a id="UIFont"></a>

### UIColor <a id="UIColor"></a>

### UIImage <a id="UIImage"></a>

### CGPoint <a id="CGPoint"></a>

### CGSize <a id="CGSize"></a>

### CGFloat <a id="CGFloat"></a>

### UIAlertViewController <a id="UIAlertViewController"></a>

### UIBarButtonItem <a id="UIBarButtonItem"></a>

### BlockButton <a id="BlockButton"></a>

### BlockWebView <a id="BlockWebView"></a>