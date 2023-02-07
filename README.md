# TestResponseChain

[![CI Status](https://img.shields.io/travis/NoRne/TestResponseChain.svg?style=flat)](https://travis-ci.org/NoRne/TestResponseChain)
[![Version](https://img.shields.io/cocoapods/v/TestResponseChain.svg?style=flat)](https://cocoapods.org/pods/TestResponseChain)
[![License](https://img.shields.io/cocoapods/l/TestResponseChain.svg?style=flat)](https://cocoapods.org/pods/TestResponseChain)
[![Platform](https://img.shields.io/cocoapods/p/TestResponseChain.svg?style=flat)](https://cocoapods.org/pods/TestResponseChain)

## ResponseChain
1.GestureRecognizer > touchesBegan = UIControl（不准确）
2.UIControl会阻止父view上的GestureRecognizer进行识别，导致响应链继续传递，从而走到touchesBegan -> UIControl
3.GestureRecognizer 参数
- delaysTouchesBegan (false)
手势识别期间，触摸状态改变，是否阻止响应链的传递
- cancelsTouchesInView（true）
手势识别成功，是否阻止响应链的传递
- delaysTouchesEnded（true）
手势识别失败，是否允许延迟（0.15s）再传递给响应链，不允许的话就是立刻传递
4.寻找最佳响应者时，是后添加的view先调用hitTest方法，hitTest实现中调用pointInside方法
5.系统UIControl优先级比父view的GestureRecognizer优先级高，但是自定义的UIControl不是
6.Control的touches相关方法正常触发，不代表target-action就会触发，他们是不同的判断逻辑（猜测target-action的触发与isHighlighted有某种关系）

7.找到最佳响应者后，先直接传递至最佳响应者
- 此时响应者的父view如果有GestureRecognizer，且自己不是系统的UIControl。
响应GestureRecognizer
- 此时响应者的父view没有GestureRecognizer，或自己是系统的UIControl。
触发自己的touchesBegin相关方法，如果自己是control或者手动终止响应链传递，则会终止传递，否则继续传递到nextResponder，重复第一步。

## Author

NoRne, yupeng@projz.com

## License

TestResponseChain is available under the MIT license. See the LICENSE file for more info.
