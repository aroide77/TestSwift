//
//  AppDelegate.swift
//  SwiftAppTest
//
//  Created by 김택훈 on 2019. 7. 4..
//  Copyright © 2019년 Kakao. All rights reserved.
//

import Cocoa

class HTMLElement {
    let name: String
    let text: String?
    
    var testClosure: (()->())? = nil
    
    lazy var asHTML: () -> (String) = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        var element : HTMLElement? = HTMLElement(name: "html name", text:"text name")
        print(element?.asHTML() ?? "")
        element?.testClosure = {
            print(element?.name ?? "")
        }
//
//        if let closure = element?.testClosure {
//            closure()
//        }
//
        element = nil
        
//        var heading:HTMLElement! = HTMLElement(name: "h1")
//        let defaultText = "some default text"
//        heading.asHTML = {
//            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
//        }
//        print(heading.asHTML())
//        heading = nil
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

