//
//  ResponseChainView.swift
//  TestResponseChain_Example
//
//  Created by NoRne on 2023/2/7.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class ResponseChainView: UIView {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("view:\(self) touchesBegan")
    super.touchesBegan(touches, with: event)
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("view:\(self) touchesMoved")
    super.touchesMoved(touches, with: event)
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("view:\(self) touchesCancelled")
    super.touchesCancelled(touches, with: event)
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("view:\(self) touchesEnded")
    super.touchesEnded(touches, with: event)
  }

  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    if self.isUserInteractionEnabled == false || self.isHidden == true || self.alpha <= 0.01 {
      return nil
    }
    // 触摸点若不在当前视图上则无法响应事件
    if !self.point(inside: point, with: event) {
      return nil
    }
    // 从后往前遍历子视图数组
    for i in stride(from: self.subviews.count - 1, through: 0, by: -1) {
      let childView = self.subviews[i]
      let childPoint = self.convert(point, to: childView)
      if let fitView = childView.hitTest(childPoint, with: event) {
        // 如果子视图中有更合适的就返回
        return fitView
      }
    }
    // 没有在子视图中找到更合适的响应视图，那么自身就是最合适的
    return self
  }
}
