//
//  ViewController.swift
//  TestResponseChain
//
//  Created by NoRne on 02/07/2023.
//  Copyright (c) 2023 NoRne. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx

class ViewController: UIViewController {
  private lazy var responseChainView: ResponseChainView = .init().also {
    $0.backgroundColor = .yellow
  }
  private lazy var contentStackView: UIStackView = .init().also {
    $0.axis = .vertical
    $0.spacing = 20
    $0.alignment = .center
  }
  private lazy var button = ResponseChainButton().also {
    $0.backgroundColor = .blue
    $0.setTitle("click me button", for: .normal)
  }
  private lazy var button2 = ResponseChainButton()
  private lazy var control = ResponseChainControl().also {
    $0.backgroundColor = .red
    $0.text = "click me control"
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
    setupBindings()
  }
  private func setupSubviews() {
    view.addSubview(responseChainView)
    responseChainView.snp.makeConstraints{ make in
      make.edges.equalToSuperview()
    }
    responseChainView.addSubview(contentStackView)
    contentStackView.snp.makeConstraints{ make in
      make.center.equalToSuperview()
    }
    contentStackView.addArrangedSubview(button)
//    button.addSubview(button2)
//    button2.snp.makeConstraints{ make in
//      make.edges.equalToSuperview()
//    }
    contentStackView.addArrangedSubview(control)
  }
  private func setupBindings() {
//    let bgTap = UITapGestureRecognizer(target: self, action: #selector(bgTapAction))
//    responseChainView.addGestureRecognizer(bgTap)

//    let tap1 = UITapGestureRecognizer(target: self, action: #selector(buttonTapAction))
//    button.addGestureRecognizer(tap1)
    button.rx.controlEvent(.touchUpInside).subscribe( onNext: { _ in
      debugPrint("button clicked")
    }).disposed(by: rx.disposeBag)

//    button2.rx.controlEvent(.touchUpInside).subscribe( onNext: { _ in
//      debugPrint("button2 clicked")
//    }).disposed(by: rx.disposeBag)

//    let tap2 = UITapGestureRecognizer(target: self, action: #selector(controlTapAction))
//    control.addGestureRecognizer(tap2)
    control.rx.controlEvent(.touchUpInside).subscribe( onNext: { _ in
      debugPrint("control clicked")
    }).disposed(by: rx.disposeBag)
  }
  @objc func bgTapAction() {
    debugPrint("bgTapAction clicked")
  }
  @objc func buttonTapAction() {
    debugPrint("buttonTapAction clicked")
  }
  @objc func controlTapAction() {
    debugPrint("controlTapAction clicked")
  }
}
