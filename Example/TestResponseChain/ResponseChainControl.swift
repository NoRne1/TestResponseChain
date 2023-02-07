//
//  ResponseChainControl.swift
//  TestResponseChain_Example
//
//  Created by NoRne on 2023/2/7.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class ResponseChainControl: UIControl {
  override open var isHighlighted: Bool {
    didSet {
      alpha = isHighlighted ? 0.4 : 1.0
    }
  }
  var text: String? {
    didSet {
      titleLabel.text = text
    }
  }
  private let coverView: ResponseChainView = .init()
  private let titleLabel: UILabel = .init()
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(titleLabel)
    titleLabel.snp.makeConstraints{ make in
      make.edges.equalToSuperview()
    }
    addSubview(coverView)
    coverView.snp.makeConstraints{ make in
      make.edges.equalToSuperview()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("UIControl:\(self) touchesBegan")
    super.touchesBegan(touches, with: event)
  }
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("UIControl:\(self) touchesMoved")
    super.touchesMoved(touches, with: event)
  }
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("UIControl:\(self) touchesCancelled")
    super.touchesCancelled(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    debugPrint("UIControl:\(self) touchesEnded")
    super.touchesEnded(touches, with: event)
  }
  override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
    debugPrint("UIControl:\(self) sendAction")
    super.sendAction(action, to: target, for: event)
  }
}
