//
//  DynamicValue.swift
//  MVVMArchitectureiOS
//
//  Created by Atif on 08/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import Foundation

typealias CompletionHandler = (() -> Void)

class Observable<T> {

    var value: T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    deinit {
        observers.removeAll()
    }
    
    private func notify() {
        observers.forEach({ $0.value() })
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
}
