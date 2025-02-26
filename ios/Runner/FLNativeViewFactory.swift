//
//  FLNativeViewFactory.swift
//  Runner
//
//  Created by Aidar Maratbekov on 25.02.2025.
//

import SwiftUI
import UIKit
import Flutter

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView){
        
        let keyWindow = UIApplication.shared.windows.first(where: {
            $0.isKeyWindow
        }) ?? UIApplication.shared.windows.first
        
        let topController = keyWindow?.rootViewController
        
        let vc = UIHostingController(rootView: SplineUIView())
        
        let splineView = vc.view!
        splineView.translatesAutoresizingMaskIntoConstraints = false
//        splineView.backgroundColor = .clear
//        vc.view.backgroundColor = .clear
//        _view.backgroundColor = .clear
//        
        topController!.addChild(vc)
        
        _view.addSubview(splineView)
        
        NSLayoutConstraint.activate([
            splineView.centerXAnchor.constraint(equalTo: _view.centerXAnchor),
            splineView.centerYAnchor.constraint(equalTo: _view.centerYAnchor),
            splineView.widthAnchor.constraint(equalTo: _view.widthAnchor),   // ✅ Задаем ширину
            splineView.heightAnchor.constraint(equalTo: _view.heightAnchor) 
        ])
        
        vc.didMove(toParent: topController)
        
    }
}
