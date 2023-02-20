//
//  ResponseChainButton.swift
//  TestResponseChain_Example
//
//  Created by NoRne on 2023/2/7.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class ResponseChainButton: UIButton {
  override open var isHighlighted: Bool {
    didSet {
      alpha = isHighlighted ? 0.4 : 1.0
    }
  }
  private let coverView: ResponseChainView = .init().also {
    $0.backgroundColor = .orange
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(coverView)
    coverView.snp.makeConstraints{ make in
      make.width.equalToSuperview().multipliedBy(0.5)
      make.top.bottom.trailing.equalToSuperview()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("UIButton:\(self) touchesBegan")
    super.touchesBegan(touches, with: event)
  }
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("UIButton:\(self) touchesMoved")
    super.touchesMoved(touches, with: event)
  }
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("UIButton:\(self) touchesCancelled")
    super.touchesCancelled(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("UIButton:\(self) touchesEnded")
    super.touchesEnded(touches, with: event)
  }

  override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
    debugPrint("UIButton:\(self) sendAction")
    super.sendAction(action, to: target, for: event)
  }
}
