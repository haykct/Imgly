//
//  Theme.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 22.12.23.
//

import SwiftUI

protocol Theme {
    var type: ThemeType { get }
    var primaryColor: Color { get }
    var secondaryColor: Color { get }
}
