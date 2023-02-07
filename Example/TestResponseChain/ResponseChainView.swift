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
}
