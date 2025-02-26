//
//  FLPlugin.swift
//  Runner
//
//  Created by Aidar Maratbekov on 25.02.2025.
//


import Flutter
import UIKit

class FLPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = FLNativeViewFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: "MySwiftUIView")
    }
}
