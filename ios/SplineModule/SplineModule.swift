//
//  SplineModule.swift
//  Runner
//
//  Created by Aidar Maratbekov on 25.02.2025.
//

import Foundation

@objc(MyModule)
class MyModule: NSObject {
    @objc func sayHello() -> String {
        return "Hello from iOS Module!"
    }
}
