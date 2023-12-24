//
//  Injected.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 23.12.23.
//

@propertyWrapper struct Injected<Value> {
    var wrappedValue: Value

    init() {
        wrappedValue = Injection.shared.container.resolve(Value.self)!
    }
}
