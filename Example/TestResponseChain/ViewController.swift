//
//  ViewController.swift
//  TestResponseChain
//
//  Created by NoRne on 02/07/2023.
//  Copyright (c) 2023 NoRne. All rights reserved.
//

import NSObject_Rx
import RxSwift
import UIKit

class ViewController: UIViewController {
  private lazy var responseChainView: ResponseChainView = .init().also {
    $0.backgroundColor = .yellow
  }

  private lazy var responseChainView2: ResponseChainView = .init().also {
    $0.backgroundColor = .blue
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

  private lazy var responseChainView3: ResponseChainView = .init().also {
    $0.backgroundColor = .red
  }

  private lazy var button2 = ResponseChainButton()
  private lazy var control = ResponseChainControl().also {
    $0.backgroundColor = .red
//    $0.text = "click me control"
  }

  private lazy var control2 = UIControl().also {
    $0.backgroundColor = .blue
//    $0.text = "click me control2"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
    setupBindings()
  }

  private func setupSubviews() {
    view.addSubview(responseChainView)
    responseChainView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
//    responseChainView.addSubview(responseChainView2)
//    responseChainView2.snp.makeConstraints{ make in
//      make.center.equalToSuperview()
//      make.size.equalTo(200)
//    }

//    responseChainView.addSubview(contentStackView)
//    contentStackView.snp.makeConstraints { make in
//      make.center.equalToSuperview()
//    }

//    contentStackView.addArrangedSubview(button)
//    button.snp.makeConstraints { make in
//      make.size.equalTo(100)
//    }
//    button.addSubview(responseChainView3)
//    responseChainView3.snp.makeConstraints { make in
//      make.center.equalToSuperview()
//      make.size.equalTo(50)
//    }

//    button.addSubview(button2)
//    button2.snp.makeConstraints{ make in
//      make.edges.equalToSuperview()
//    }

    responseChainView.addSubview(control)
    control.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.size.equalTo(100)
    }
//    control.addSubview(control2)
//    control2.snp.makeConstraints { make in
//      make.center.equalToSuperview()
//      make.size.equalTo(50)
//    }
  }

  private func setupBindings() {
    let bgTap = UITapGestureRecognizer(target: self, action: #selector(bgTapAction))
    bgTap.delegate = self
    responseChainView.addGestureRecognizer(bgTap)
//    let bgTap2 = UITapGestureRecognizer(target: self, action: #selector(bgTapAction2))
//    responseChainView2.addGestureRecognizer(bgTap2)

//    let tap1 = UITapGestureRecognizer(target: self, action: #selector(buttonTapAction))
//    button.addGestureRecognizer(tap1)

//    button.rx.controlEvent(.touchUpInside).subscribe(onNext: { _ in
//      debugPrint("button clicked")
//    }).disposed(by: rx.disposeBag)

//    button2.rx.controlEvent(.touchUpInside).subscribe( onNext: { _ in
//      debugPrint("button2 clicked")
//    }).disposed(by: rx.disposeBag)

    let tap2 = UITapGestureRecognizer(target: self, action: #selector(controlTapAction))
    tap2.delegate = self
    control.addGestureRecognizer(tap2)

//    control.rx.controlEvent(.touchUpInside).subscribe( onNext: { _ in
//      debugPrint("control clicked")
//    }).disposed(by: rx.disposeBag)

//    control2.rx.controlEvent(.touchUpInside).subscribe( onNext: { _ in
//      debugPrint("control2 clicked")
//    }).disposed(by: rx.disposeBag)
  }

  @objc func bgTapAction() {
    debugPrint("bgTapAction clicked")
  }

  @objc func bgTapAction2() {
    debugPrint("bgTapAction2 clicked")
  }

  @objc func buttonTapAction() {
    debugPrint("buttonTapAction clicked")
  }

  @objc func controlTapAction() {
    debugPrint("controlTapAction clicked")
  }
}
extension ViewController: UIGestureRecognizerDelegate {
//  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//    false
//  }
//  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//    false
//  }
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    true
  }
}
